function [t_1_rm_lme] = one_way_lme_table_entry(num_in,sub_in,data_agg,...
                comp_descip_in, n_sample,lme_stats_out)

%number of entries - support for 1 entry now
nb_entries = 1;

%% Assign vars
fig_num = repmat(num_in,nb_entries,1);
fig_sub = string(repmat(sub_in,nb_entries,1));
data_agg = string(repmat(data_agg,nb_entries,1));
comp_descrip = {comp_descip_in;};
%n_sample = [size(learn.A,1)]';
test_name = repmat({'1-way RM linear mixed effects analysis'},nb_entries,1);
n_dof = string(repmat('N/A', nb_entries,1));
test_statistic = string(['F{',num2str(table2array(lme_stats_out(1,3))),', ',...
                    num2str(table2array(lme_stats_out(1,4))),...
                     ') = ', num2str(table2array(lme_stats_out(1,2)))]);

adj_method = string(repmat('N/A', nb_entries,1));
p_all = [table2array(lme_stats_out(1,5))]';
p_adj = string(repmat('N/A', nb_entries,1));
sig_level = check_p_value_sig(p_all);

%% create table
t_1_rm_lme = table(fig_num, fig_sub, data_agg, comp_descrip, n_sample,...
            test_name, n_dof, test_statistic, p_all, p_adj, adj_method, sig_level,...
            'VariableNames',{'Figure','Subfigure','Data aggregation',...
            'Comparison','N', 'Test', 'Degrees of Freedom', 'Test statistic',...
            'p-value', 'p-value adjusted', 'Adjustment method','Significance'});

end

