function [outputArg1,outputArg2] = writeUnPairedTtestAnimal(actx_word_p,doc_handle,comp_descrip,test_stat,p_val, dof, sample_n)

%word style and font settings
%actx_word_p.Selection.Style = 'Normal';
actx_word_p.Selection.Font.Name = 'Arial';
actx_word_p.Selection.Font.Size = 12;
%set font color 
actx_word_p.Selection.Font.ColorIndex='wdAuto';%set back to default color


%% Descriptive test in bold
%set bold font
actx_word_p.Selection.Font.Bold = true;
%desriptor
actx_word_p.Selection.TypeText(comp_descrip)
%turn bold off
actx_word_p.Selection.Font.Bold = false;
%write test name
actx_word_p.Selection.TypeText(': two-tailed unpaired ');
actx_word_p.Selection.Font.Italic = true;
actx_word_p.Selection.TypeText('t');
actx_word_p.Selection.Font.Italic = false;
actx_word_p.Selection.TypeText('-test, ');

%insert test statistic W
actx_word_p.Selection.Font.Italic = true;
actx_word_p.Selection.TypeText('t')
actx_word_p.Selection.Font.Italic = false;
%with DOF as subscript
%set subscript state
actx_word_p.Selection.Font.Subscript = true;
actx_word_p.Selection.TypeText(num2str(dof))
actx_word_p.Selection.Font.Subscript = false;

actx_word_p.Selection.TypeText(' = ')

%test statistic value (2 decimal round)
actx_word_p.Selection.TypeText(num2str(round(test_stat,2)));
%insert p value star significance
actx_word_p.Selection.TypeText(', ');
%make sure the p-value is significant before inserting star
if p_val < 0.05
actx_word_p.Selection.TypeText(char(check_p_value_sig(p_val)))
end

%turn italic font on
actx_word_p.Selection.Font.Italic = true;
actx_word_p.Selection.TypeText('P')
actx_word_p.Selection.Font.Italic = false;
%insert p-value depending on value
if p_val < 0.001
actx_word_p.Selection.TypeText(' < 0.001')
else
    actx_word_p.Selection.TypeText(' = ');
    actx_word_p.Selection.TypeText(num2str(round(p_val,3)));
end

%process number of animals input
split_n = double(split(sample_n,', '));

%number of animals
actx_word_p.Selection.TypeText(', ');
actx_word_p.Selection.Font.Italic = true;
actx_word_p.Selection.TypeText('n');
actx_word_p.Selection.Font.Italic = false;
actx_word_p.Selection.TypeText([' = ', num2str(split_n(1)),' learn cohort, ',...
            num2str(split_n(2)),' recall cohort',' mice']);
%actx_word_p.Selection.TypeText([' = ', num2str(sample_n),' ', 'mice']);

%p value correction
actx_word_p.Selection.TypeText(', Holm-Sidak correction')

end

