% run a sensitity analysis on Li percentage replaced & emissions impact 
setTransportSF(1);
percents = linspace(0,1,4);
colors = getChemColors; 
NMCkgkg = zeros(length(percents), 9, 3);    NMCkwkg = zeros(length(percents), 9, 3);
NMCmjkg = zeros(length(percents), 9, 3);    NMCmjkw = zeros(length(percents), 9, 3);
NCAkgkg = zeros(length(percents), 9, 3);    NCAkwkg = zeros(length(percents), 9, 3);
NCAmjkg = zeros(length(percents), 9, 3);    NCAmjkw = zeros(length(percents), 9, 3);
LFPkgkg = zeros(length(percents), 9, 3);    LFPkwkg = zeros(length(percents), 9, 3); 
LFPmjkg = zeros(length(percents), 9, 3);    LFPmjkw = zeros(length(percents), 9, 3); 

%types = 10; 
monteCarloRuns = 50; 
for a = 1:size(percents,2)
    setLiPercent(percents(a));
    runRecyclingModel(monteCarloRuns); 
        for v = 1:2
        % save the median, percentile data for NMC and NCA 
            [mfgSummaryPlotData, recyclingSummaryPlots, plotDiffYieldPyroDirect,...
                plotDiffYieldNothingDirect, plotDiffYieldHydroDirect, ...
                transportDataSummary, mfgFullData] = formatPlotData(1, v); 
            for z = 1:3
                NMCkgkg(a+(v-1)*size(percents,2),:,z) = [recyclingSummaryPlots(1,1,z), recyclingSummaryPlots(1,13,z), ...
                recyclingSummaryPlots(1, 25,z), recyclingSummaryPlots(2,2,z), ...
                recyclingSummaryPlots(2, 14, z), recyclingSummaryPlots(2,26,z), ...
                recyclingSummaryPlots(3,3,z), recyclingSummaryPlots(3,15,z), recyclingSummaryPlots(3,27,z)]; 
                NCAkgkg(a+(v-1)*size(percents,2),:,z) = [recyclingSummaryPlots(1,5,z), recyclingSummaryPlots(1,17,z), ...
                recyclingSummaryPlots(1, 29,z), recyclingSummaryPlots(2,6,z), ...
                recyclingSummaryPlots(2, 18, z), recyclingSummaryPlots(2,30,z), ...
                recyclingSummaryPlots(3,11,z), recyclingSummaryPlots(3,19,z), recyclingSummaryPlots(3,31,z)]; 
                LFPkgkg(a+(v-1)*size(percents,2),:,z) = [recyclingSummaryPlots(1,9,z), recyclingSummaryPlots(1,21,z), ...
                recyclingSummaryPlots(1, 33,z), recyclingSummaryPlots(2,10,z), ...
                recyclingSummaryPlots(2, 22, z), recyclingSummaryPlots(2,34,z), ...
                recyclingSummaryPlots(3,15,z), recyclingSummaryPlots(3,23,z), recyclingSummaryPlots(3,35,z)];
            end
            [mfgSummaryPlotData, recyclingSummaryPlots, plotDiffYieldPyroDirect,...
                plotDiffYieldNothingDirect, plotDiffYieldHydroDirect, ...
                transportDataSummary, mfgFullData] = formatPlotData(2, v); 
            for z = 1:3
                NMCkwkg(a+(v-1)*size(percents,2),:,z) = [recyclingSummaryPlots(1,1,z), recyclingSummaryPlots(1,13,z), ...
                recyclingSummaryPlots(1, 25,z), recyclingSummaryPlots(2,2,z), ...
                recyclingSummaryPlots(2, 14, z), recyclingSummaryPlots(2,26,z), ...
                recyclingSummaryPlots(3,3,z), recyclingSummaryPlots(3,15,z), recyclingSummaryPlots(3,27,z)]; 
                NCAkwkg(a+(v-1)*size(percents,2),:,z) = [recyclingSummaryPlots(1,5,z), recyclingSummaryPlots(1,17,z), ...
                recyclingSummaryPlots(1, 29,z), recyclingSummaryPlots(2,6,z), ...
                recyclingSummaryPlots(2, 18, z), recyclingSummaryPlots(2,30,z), ...
                recyclingSummaryPlots(3,11,z), recyclingSummaryPlots(3,19,z), recyclingSummaryPlots(3,31,z)]; 
                LFPkwkg(a+(v-1)*size(percents,2),:,z) = [recyclingSummaryPlots(1,9,z), recyclingSummaryPlots(1,21,z), ...
                recyclingSummaryPlots(1, 33,z), recyclingSummaryPlots(2,10,z), ...
                recyclingSummaryPlots(2, 22, z), recyclingSummaryPlots(2,34,z), ...
                recyclingSummaryPlots(3,15,z), recyclingSummaryPlots(3,23,z), recyclingSummaryPlots(3,35,z)];
            end
            [mfgSummaryPlotData, recyclingSummaryPlots, plotDiffYieldPyroDirect,...
                plotDiffYieldNothingDirect, plotDiffYieldHydroDirect, ...
                transportDataSummary, mfgFullData] = formatPlotData(3, v); 
            for z = 1:3
                NMCmjkg(a+(v-1)*size(percents,2),:,z) = [recyclingSummaryPlots(1,1,z), recyclingSummaryPlots(1,13,z), ...
                recyclingSummaryPlots(1, 25,z), recyclingSummaryPlots(2,2,z), ...
                recyclingSummaryPlots(2, 14, z), recyclingSummaryPlots(2,26,z), ...
                recyclingSummaryPlots(3,3,z), recyclingSummaryPlots(3,15,z), recyclingSummaryPlots(3,27,z)]; 
                NCAmjkg(a+(v-1)*size(percents,2),:,z) = [recyclingSummaryPlots(1,5,z), recyclingSummaryPlots(1,17,z), ...
                recyclingSummaryPlots(1, 29,z), recyclingSummaryPlots(2,6,z), ...
                recyclingSummaryPlots(2, 18, z), recyclingSummaryPlots(2,30,z), ...
                recyclingSummaryPlots(3,11,z), recyclingSummaryPlots(3,19,z), recyclingSummaryPlots(3,31,z)]; 
                LFPmjkg(a+(v-1)*size(percents,2),:,z) = [recyclingSummaryPlots(1,9,z), recyclingSummaryPlots(1,21,z), ...
                recyclingSummaryPlots(1, 33,z), recyclingSummaryPlots(2,10,z), ...
                recyclingSummaryPlots(2, 22, z), recyclingSummaryPlots(2,34,z), ...
                recyclingSummaryPlots(3,15,z), recyclingSummaryPlots(3,23,z), recyclingSummaryPlots(3,35,z)];
            end
            [mfgSummaryPlotData, recyclingSummaryPlots, plotDiffYieldPyroDirect,...
                plotDiffYieldNothingDirect, plotDiffYieldHydroDirect, ...
                transportDataSummary, mfgFullData] = formatPlotData(4, v); 
            for z = 1:3
                NMCmjkw(a+(v-1)*size(percents,2),:,z) = [recyclingSummaryPlots(1,1,z), recyclingSummaryPlots(1,13,z), ...
                recyclingSummaryPlots(1, 25,z), recyclingSummaryPlots(2,2,z), ...
                recyclingSummaryPlots(2, 14, z), recyclingSummaryPlots(2,26,z), ...
                recyclingSummaryPlots(3,3,z), recyclingSummaryPlots(3,15,z), recyclingSummaryPlots(3,27,z)]; 
                NCAmjkw(a+(v-1)*size(percents,2),:,z) = [recyclingSummaryPlots(1,5,z), recyclingSummaryPlots(1,17,z), ...
                recyclingSummaryPlots(1, 29,z), recyclingSummaryPlots(2,6,z), ...
                recyclingSummaryPlots(2, 18, z), recyclingSummaryPlots(2,30,z), ...
                recyclingSummaryPlots(3,11,z), recyclingSummaryPlots(3,19,z), recyclingSummaryPlots(3,31,z)]; 
                LFPmjkw(a+(v-1)*size(percents,2),:,z) = [recyclingSummaryPlots(1,9,z), recyclingSummaryPlots(1,21,z), ...
                recyclingSummaryPlots(1, 33,z), recyclingSummaryPlots(2,10,z), ...
                recyclingSummaryPlots(2, 22, z), recyclingSummaryPlots(2,34,z), ...
                recyclingSummaryPlots(3,15,z), recyclingSummaryPlots(3,23,z), recyclingSummaryPlots(3,35,z)];
            end
        end   
end 

% save the data
cd OutputFiles
    csvwrite('LiSensitivityDataNMC.csv', [NMCkgkg(:,:,1), NMCkgkg(:,:,2), ...
        NMCkgkg(:,:,3); NMCkwkg(:,:,1), NMCkwkg(:,:,2), NMCkwkg(:,:,2); ...
        NMCmjkg(:,:,1), NMCmjkg(:,:,2), NMCmjkg(:,:,3); NMCmjkw(:,:,1), ...
        NMCmjkw(:,:,2), NMCmjkw(:,:,3)]); 

    csvwrite('LiSensitivityDataNCA.csv', [NCAkgkg(:,:,1), NCAkgkg(:,:,2), ...
        NCAkgkg(:,:,3); NCAkwkg(:,:,1), NCAkwkg(:,:,2), NCAkwkg(:,:,2); ...
        NCAmjkg(:,:,1), NCAmjkg(:,:,2), NCAmjkg(:,:,3); NCAmjkw(:,:,1), ...
        NCAmjkw(:,:,2), NCAmjkw(:,:,3)]); 
    
    csvwrite('LiSensitivityDataLFP.csv', [LFPkgkg(:,:,1), LFPkgkg(:,:,2), ...
        LFPkgkg(:,:,3); LFPkwkg(:,:,1), LFPkwkg(:,:,2), LFPkwkg(:,:,2); ...
        LFPmjkg(:,:,1), LFPmjkg(:,:,2), LFPmjkg(:,:,3); LFPmjkw(:,:,1), ...
        LFPmjkw(:,:,2), LFPmjkw(:,:,3)]); 

cd ../
%% make a figure kg for kg 

ylabels = {'kg of CO_2_e avoided per kg battery', ...
    'kg CO_2_e avoided per kWh battery', 'MJ avoided per kg battery', ...
    'MJ avoided per kWh battery'}; 
figNames = {'liEmissionsSensitivitykgkg_cyl', 'liEmissionsSensitivitykwkg_cyl', ...
    'liEmissionsSensitivitymjkg_cyl', 'liEmissionsSensitivitymjkw_cyl', ...
    'liEmissionsSensitivitykgkg_prism', 'liEmissionsSensitivitykwkg_prism', ...
    'liEmissionsSensitivitymjkg_prism', 'liEmissionsSensitivitymjkw_prism'}; 
y_limits = [15, 110, 170, 1200];
x_axes = [0.1, 0.39, 0.68]; 
y_axes = 0.15; 
x_len = 0.24;
y_len = 0.78; 
titles = {'US avg.', 'NWPP', 'RFCM'}; 

len = size(NMCkgkg,1)/2; 
for v = 1:2
    for y = 1:4
        figure(1)
        set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [0 0 7 3]);
        if y==1
            NMC = NMCkgkg((v-1)*len+1:v*len,:,:); 
            NCA = NCAkgkg((v-1)*len+1:v*len,:,:); 
            LFP = LFPkgkg((v-1)*len+1:v*len,:,:); 
        elseif y == 2
            NMC = NMCkwkg((v-1)*len+1:v*len,:,:); 
            NCA = NCAkwkg((v-1)*len+1:v*len,:,:); 
            LFP = LFPkwkg((v-1)*len+1:v*len,:,:); 
        elseif y == 3
            NMC = NMCmjkg((v-1)*len+1:v*len,:,:); 
            NCA = NCAmjkg((v-1)*len+1:v*len,:,:); 
            LFP = LFPmjkg((v-1)*len+1:v*len,:,:); 
        else 
        NMC = NMCmjkw((v-1)*len+1:v*len,:,:); 
        NCA = NCAmjkw((v-1)*len+1:v*len,:,:); 
        LFP = LFPmjkw((v-1)*len+1:v*len,:,:); 
        end
        for z = 1:3
            subplot('Position', [x_axes(z) y_axes x_len y_len])
            hold on
            shadedErrorBar(percents, fliplr(NMC(:, 1, 1)'), [fliplr(NMC(:, 1, 3)'-NMC(:, 1, 1)'); ...
                fliplr(NMC(:, 1, 1)'- NMC(:, 1, 2)')], {'Color', colors(1,:)}, 1);
            shadedErrorBar(percents, fliplr(NCA(:, 1, 1)'), [fliplr(NCA(:, 1, 3)'-NCA(:, 1, 1)'); ...
                fliplr(NCA(:, 1, 1)'- NCA(:, 1, 2)')], {'Color', colors(2,:)}, 1);
            shadedErrorBar(percents, fliplr(LFP(:, 1, 1)'), [fliplr(LFP(:, 1, 3)'-LFP(:, 1, 1)'); ...
                fliplr(LFP(:, 1, 1)'- LFP(:, 1, 2)')], {'Color', colors(3,:)}, 1);
            axis([0 1 0 y_limits(y)]); 
            rectangle('Position', [0.6 0 0.4 y_limits(y)], 'FaceColor', [0.5 0.5 0.5, 0.5], 'LineStyle', 'none');
            xlabel('Lithium Added (%)');
            set(gca, 'XtickLabels', {'0%', '50%', '100%'});
            title(titles(z)); 
            if z ==1 
            ylabel(ylabels(y)); 
            end
            if z == 3 
                if y == 1
                    text(1, NMC(1,1,1)+0.5, 'NMC', 'FontSize', 9, 'color', colors(1,:));
                    text(1, NCA(1,1,1), 'NCA', 'FontSize', 9, 'color', colors(2,:));
                    text(1, LFP(1,1,1), 'LFP', 'FontSize', 9, 'color', colors(3,:));
                elseif y == 2
                    if v==1
                        text(1, NMC(1,1,1)-2, 'NMC', 'FontSize', 9, 'color', colors(1,:));
                        text(1, NCA(1,1,1), 'NCA', 'FontSize', 9, 'color', colors(2,:));
                        text(1, LFP(1,1,1), 'LFP', 'FontSize', 9, 'color', colors(3,:));
                    else
                        text(1, NMC(1,1,1), 'NMC', 'FontSize', 9, 'color', colors(1,:));
                        text(1, NCA(1,1,1)+5, 'NCA', 'FontSize', 9, 'color', colors(2,:));
                        text(1, LFP(1,1,1)-5, 'LFP', 'FontSize', 9, 'color', colors(3,:));
                    end
                elseif y == 4
                    if v == 1
                        text(1, NMC(1,1,1)-50, 'NMC', 'FontSize', 9, 'color', colors(1,:));
                        text(1, NCA(1,1,1)+50, 'NCA', 'FontSize', 9, 'color', colors(2,:));
                        text(1, LFP(1,1,1), 'LFP', 'FontSize', 9, 'color', colors(3,:));
                    else
                        text(1, NMC(1,1,1)-10, 'NMC', 'FontSize', 9, 'color', colors(1,:));
                        text(1, NCA(1,1,1)-60, 'NCA', 'FontSize', 9, 'color', colors(2,:));
                        text(1, LFP(1,1,1)+40, 'LFP', 'FontSize', 9, 'color', colors(3,:));
                    end
                else
                text(1, NMC(1,1,1), 'NMC', 'FontSize', 9, 'color', colors(1,:));
                text(1, NCA(1,1,1), 'NCA', 'FontSize', 9, 'color', colors(2,:));
                text(1, LFP(1,1,1), 'LFP', 'FontSize', 9, 'color', colors(3,:));
                end
            end
        end
        name = strjoin(figNames(y+(v-1)*4)); 
    cd Figures
        print('-r300', name, '-dpng')
    cd ../ 
    clf(1)
    end
end