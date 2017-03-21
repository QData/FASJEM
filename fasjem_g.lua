-------------------------------------------------------------------------------
-- This is the lua implementation of FASJEM-G method based on torch7 (http://--
-- torch.ch/).                                                               --
-- For GPU version of FASJEM-G, simply use the 'cutorch' library in torch7(i.--
-- e. x = x:cuda()).                                                         --
-- Author: Beilun Wang and Dr. Yanjun Qi                                     --
-- Date: Feb 5th, 2016                                                       --
-- Thanks for Zeming Lin's help                                              --
-------------------------------------------------------------------------------

-- If you would like to use the GPU version of FASJEM, you should include the
-- 'cutorch' package in torch7.
require('cutorch')

--close form solution for four proximities
function f1(x, gamma)
    return torch.add(torch.cmax(torch.add(x,-gamma),0),torch.cmin(torch.add(x,gamma),0))
end

function g1(x, a, lambda)
    return torch.add(torch.clamp(torch.add(x, - a), -lambda, lambda), a)
end

function f2(x, gamma)
    return torch.cmul(x,torch.repeatTensor(torch.cmax(torch.add(- torch.pow(torch.norm(x,2,3), -1) * gamma, 1), 0), 1, 1, x:size(3)))
end

function g2(x, a, lambda)
    return torch.add(torch.cmul(torch.repeatTensor(torch.cmin(torch.cdiv(torch.CudaTensor(x:size(1),x:size(2),1):fill(lambda),torch.norm(torch.add(x, -a),2,3)),1),1,1,x:size(3)),torch.add(x, -a)), a)
end

function fasjem_g(x, a, lambda, epslion, gamma, rho, iterMax)
	---------------------------------------------------------------------------
	-- x is a third order tensor representing the estimated graphs           --
	-- a is a third order tensor representing the backward mapping of inverse--
	-- of covariance matrices                                                --
	-- lambda captures the sparsity parameter                                --
	-- epslion captures the differences between two regularization function  --
	-- gamma is the parameter for proximity                                  --
	-- rho is the learning rate                                              --
	-- iterMax is the maximum number of iterations                           --
	---------------------------------------------------------------------------
	local x1 = x
	local x2 = x
	local x3 = x
	local x4 = x

	for i=1,iterMax do

    local p1 = f1(x1, (4 * lambda * gamma))
    local p2 = g1(x2, a, (4 * lambda * gamma * epslion))
    local p3 = f2(x3, lambda)
    local p4 = g2(x4, a, (epslion * lambda))

    local p  = (p1 + p2 + p3 + p4) / 4

    x1 = x1 + (p * 2 - p1 - x1 ) * rho
    x2 = x2 + (p * 2 - p2 - x2 ) * rho
    x3 = x3 + (p * 2 - p3 - x3 ) * rho
    x4 = x4 + (p * 2 - p4 - x4 ) * rho

    x = x  + (p - x) * rho
	end 

return x

end