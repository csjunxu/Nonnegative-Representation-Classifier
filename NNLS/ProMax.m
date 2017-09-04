function [pred_ttls, pre_matrix] = ProMax(coefs, tr_dat, trls, class_num)

%% perform prediction class-by-class
pre_matrix      =   zeros(class_num, 1);
recon_tr_descr  =   tr_dat * coefs;

for ci = 1:class_num
    loss_ci = recon_tr_descr - tr_dat(:, trls == ci) * coefs(trls == ci,:);
    pci = sum(loss_ci.^2, 1);
    pre_matrix(ci,:) = pci;
end

[~,pred_ttls] = min(pre_matrix,[],1);

end