source('mcda.R')



# Example
time_period <- c("2025-2030", "2035-2040", "2045-2050", "2055-2060")
scenarios <- c("Fmsy_RCP45", "Fmsy_RCP85", "PGY_RCP45", "PGY_RCP85", "SQ_RCP45", "SQ_RCP85")
criteria <- c("ssb", "f", "rbs", "mml", "apex_pred", "employment", "wage", "gva", "rsl", "co2")
sub_criteria <- list(ssb = c('DPS171819', 'HKE1718', 'MUT1718', 'NEP17', 'SOL17'),
                     f = c('DPS171819', 'HKE1718', 'MUT1718', 'NEP17', 'SOL17'))

mcda <- Mcda(time_period,
             scenarios,
             criteria = criteria,
             sub_criteria = "all",
             options_file = "data/MCDA_options.json")

#load data
mcda <- load_data(mcda)

mcda <- calculate_utilities(mcda, quantile = 0.5) # quantile = 0.5 it's an ... argument. 
# Without this additional argument the funciton would filter only by time period and scenario,
#returning all 3 quantile levels and failing the calculation of the utilities


mcda <- set_weights(mcda, criteria = c('ssb'), new_weights = c(1)) # change weight of any macro/sub/criteria with this function


mcda <- aggregate_utilities(mcda,
                            criteria = c('f'), 
                            label = "combined_f", 
                            method = "sum", 
                            set_weight = 1, 
                            sub_criteria = TRUE, 
                            weighted = TRUE)

mcda <- aggregate_utilities(mcda,
                            criteria = c('ssb'), 
                            label = "combined_ssb", 
                            method = "sum", 
                            set_weight = 1, 
                            sub_criteria = TRUE, 
                            weighted = TRUE)


# Combine criteria into macro-criteria

mcda <- aggregate_utilities(mcda, criteria = c('combined_f', 'combined_ssb'), label = "stocks", method = "sum", set_weight = 1, sub_criteria = FALSE, weighted = TRUE)
mcda <- aggregate_utilities(mcda, criteria = c('mml', 'apex_pred'), label = "biodiversity", method = "sum", set_weight = 1, sub_criteria = FALSE, weighted = TRUE)
mcda <- aggregate_utilities(mcda, criteria = c('rbs'), label = "habitats", method = "sum", set_weight = 1, sub_criteria = FALSE, weighted = TRUE)
mcda <- aggregate_utilities(mcda, criteria = c('employment', 'rsl', 'wage'), label = "community", method = "sum", set_weight = 1, sub_criteria = FALSE, weighted = TRUE)
mcda <- aggregate_utilities(mcda, criteria = c('gva'), label = "revenue", method = "sum", set_weight = 1, sub_criteria = FALSE, weighted = TRUE)
mcda <- aggregate_utilities(mcda, criteria = c('co2'), label = "well-being", method = "sum", set_weight = 1, sub_criteria = FALSE, weighted = TRUE)




mcda  <- run_maut(mcda,
                  criteria = c("stocks", "biodiversity","habitats", "community", "revenue", "well-being")
)

# note that the total utility is the result of the passed criteria only. keep that in mind for visualization

# transfer the results on a df
df = generate_df(mcda,
                     criteria = c("combined_f", "combined_ssb", "rbs", "mml", "apex_pred", "employment", "wage", "gva", "rsl", "co2",
                                  "stocks", "biodiversity","habitats", "community", "revenue", "well-being"),
                     sub_criteria = c('ssb', 'f'))


# select top or bottom scenarios based on 1 criterion
tops = top_scenarios(dataframe = df, 
                     criterion = 'total_utility',
                     num = 5,
                     ascending = FALSE)

# Visualization
plot_matrix(df, criteria = c("stocks", "biodiversity","habitats", "community", "revenue", "well-being", "total_utility"),
            color = "Blues")

plot_parallel_graph(df, criteria = c('combined_ssb', 'combined_f', 'rbs', 'mml', 'apex_pred', 'employment', 'wage', 'gva','co2', 'rsl'), #
                    highlight = "top",
                    top_bottom_criterion = "total_utility")

plot_histogram(df,
               criteria = c("stocks", "biodiversity","habitats", "community", "revenue", "well-being"),
               weights = mcda$weights,
               parents = mcda$parents,
               subcriteria = FALSE,
               )
