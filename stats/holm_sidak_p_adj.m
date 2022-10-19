function [p_corr_orig_order] = holm_sidak_p_adj(p,c,alpha)
%return Holm-Sidak adjusted p values (row  vector)

%for duplicates, run native with 4 comparisons, and choose the higher
%corrected p value for that duplicate value

%sort p values in ascending order (smallest to biggest)
[~,I]=sort(p); %sorted p-value vector
p_sort=p(I);

%reverse sort indices
[~,rI] = sort(I);

%list of correction p-values
J=1:c; %How many corrected alpha value?

%Sidak alpha corrected values
alphacorr=1-((1-alpha).^(1./(c-J+1)));

%p value adjustments here (Holm-Sidak - prism correction - same result)
%https://personal.utdallas.edu/~herve/abdi-Holm2010-pretty.pdf

%find at which test fail to reject null hypothesis
test_p = p_sort<alphacorr;

%index at which test fails
idx_test_fail = find(test_p == 0,1,'first');

%adjust all p-values
p_corrected = 1-(1-p_sort).^(c-J+1);

%first input p value where test failed
p_fail = p_sort(idx_test_fail);

%crop at test which failed - i.e. don't keep adjusting p-values but copy
%the previous adjusted p-value at the test which failed
%check if test found an early faiure to reject
% if ~isempty(idx_test_fail)
%     p_corrected(idx_test_fail:end) = p_corrected(idx_test_fail);    
% end

%get the unique p values in the sorted list
[unique_p_val,ia,~] = unique(p_sort);
%get indices of duplicates from original p-value vector
dup_p_idx = setdiff(1:numel(p_sort),ia);

%if duplicate values are found, make p-val adjustment
if ~isempty(dup_p_idx)
    %set duplicate p value indices to nan
    p_corrected(dup_p_idx) = nan;
    
    %for each nan, set p-value to previous one (ensures propagation of high
    %p-value for those set of p value duplicates, until the next unique
    %corrected p value is found
    for ii=1:numel(p_corrected)
        if isnan(p_corrected(ii))
            p_corrected(ii) = p_corrected(ii-1);
        end
    end
end

%replace corrected p values greater than that at which test first original
%p value failed with the adjusted p-value for that failed test

%Fix Holm-Sidak correction - approach: get lowest p-value at which the test fails, 
%get that p-value adjustment value, and then propagate that adjusted value 
%for all the test p-values greater than that - 
%do this after check for duplicate p-values has been done 
%(at least 2 input p values are numerically identical)

%if test failure occurs for any p-value
if ~isempty(p_fail)
    %find those p value indices (and values less than alpha and corrected p
    %values meeting statistical significance
    idx_p_greater = find(p_sort >= p_fail & p_sort < alpha & p_corrected < alpha);
    %replacement for adjusted p values
    p_val_replace = p_corrected(idx_test_fail);
    %replace corrected values
    p_corrected(idx_p_greater) = p_val_replace;
end

%another check here adjusted p-val for the lower cannot be greater than the
%adjustment for a higher p-values - CONTINUE HERE
%approach (after fail check and replacement above)
%1 go through corrected list of p_vals
%2 if the correct p_val is less than that before it, replace it with one
%before it

for ii=2:numel(p_corrected)
    if p_corrected(ii) < p_corrected(ii-1)
        p_corrected(ii) = p_corrected(ii-1);
    end   
end

%rearrange corrected p-values in order of input
p_corr_orig_order = p_corrected(rI);


end

