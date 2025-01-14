%% Correction Subtraction
% add in ui to get the folders rather than being dependent on being in the dir
disp('Select Compound Analysis')
comp_path = uigetdir();
disp(['User selected ', comp_path])
disp('Select AMPAR Analysis')
ampa_path = uigetdir();
disp(['User selected ', ampa_path])
comp = ephysIO(append(comp_path, '/eventer.output/ALL_events/ensemble_average.phy'));
ampa = ephysIO(append(ampa_path, '/eventer.output/ALL_events/ensemble_average.phy'));

d = dir('**/*_baseline.txt'); % dir list of baseline files
d = d(~startsWith({d.name}, '.')); % remove deleted/hidden

baseline = table2array(readtable(d.name));
t = comp.array(:,1);
b = median(baseline(10:80,2)); % 'b' is the average baseline before L689560
a = median(baseline(end-70:end,2)); % 'a' is the average baseline after L689560
A = (a + ampa.array(:,2)) * b/a; % corrected AMPAR
B = b + comp.array(:,2); % corrected compound
C = (b + (B-A)); % corrected NMNDAR

% save outputs
ephysIO('corr_ens_ave_compound.phy',[t,B],'S','V')
ephysIO('corr_ens_ave_AMPA.phy',[t,A],'S','V')
ephysIO('corr_ens_ave_NMDA.phy',[t,C],'S','V')

figure; plot(t,B); hold on; plot(t,A); plot(t,C); legend('Comp','AMPA','NMDA');
xlabel('Time (s)'); ylabel('Membrane potential (mV)'); title('Difference trace');
box off; set(gca,'linewidth',2); set(gcf,'color','white');
saveas(gcf,'corrected_subtraction_thresh.pdf')

% peakscale
array = [t B A C];
scaled_traces = peakscale(array);

% Original from Teams Conversation
% t = before.array(:,1);
% 
% b = median(baseline(10:80,2)) % 'b' is the average baseline before L689560
% 
% b =
% 
%      -0.065565
% 
% a = median(baseline(end-70:end,2)) % 'a' is the average baseline after L689560
% 
% a =
% 
%     -0.06912
% 
% A = (a + after.array(:,2)) * b/a  % 'after' is the ephysIO structure loaded from the enesemble_average.phy from eventer analysis of after L689560; 'A' is the 'after' trace corrected for baseline shift
% 
% B = b + before.array(:,2) % 'before' is the ephysIO structure loaded from the enesemble_average.phy from eventer analysis of before L689560; 'B' is the 'before' trace corrected for baseline shift
