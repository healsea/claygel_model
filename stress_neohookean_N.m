NNvary = logspace(-6+log10(5.23),-6+log10(5.23),1);
for i = 1:length(NNvary)
    NN = NNvary(i);
    stress_neohookean;
end
dataprocess