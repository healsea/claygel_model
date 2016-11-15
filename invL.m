function [ beta ] = invL( a )
fun = @(x) coth(x)-1/x-a; % only right for isotrophic dilation
beta = fzero(fun,0.5);

end
