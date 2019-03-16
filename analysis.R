#####IMPORT DATA#####
# read in CSV
hololens_data <- read.csv("PCA-Holo.csv", header = TRUE,
                          na.strings = "")

# convert columns to correct variable types
hololens_data$record_id <- as.character(hololens_data$record_id)
hololens_data$id <- as.character(hololens_data$id)

hololens_data$group <- factor(x = hololens_data$group,
                              levels = c(1, 2),
                              labels = c("Holo-first", "Discuss-first"))
hololens_data$year <- factor(x = hololens_data$year,
                             levels = c(1, 2),
                             labels = c("CO2021", "CO2022"))

#####ANALYZE DATA#####
# proportion that liked HoloLens the most overall (post_1_o4 == 1)
prop_holo_overall <- length(which(hololens_data$post_1_o4 == 1)) / sum(!is.na(hololens_data$post_1_o4))

# how much did HoloLens help compared to previous activity
holo_diff <- with(hololens_data,
                  ifelse(group == "Holo-first",
                         hl_1 - ws_1, hl_1 - paper_1))

total_diff <- with(hololens_data,
                   ifelse(group == "Holo-first",
                          paper_1 - pre_3, hl_1 - pre_3))

#####OUTPUT#####
# proportion that liked HoloLens the most overall
print(paste("Percentage of participants that thought HoloLens provided",
            "most effective learning experience overall:",
            round(100 * prop_holo_overall, digits = 2)))

# median of how much HoloLens helped
print(paste("Median improvement in understanding PCA after HoloLens (10-pt scale):",
            median(holo_diff, na.rm = TRUE)))

# stat test for how much HoloLens helped
print(paste("Wilcoxon signed-rank to test if difference in self-reported",
            "understanding of PCA before and after HoloLens equals zero:"))
suppressWarnings(wilcox.test(holo_diff)) # cleaner output

# median of how much HoloLens helped
print(paste("Median improvement in understanding PCA after all activities (10-pt scale):",
            median(total_diff, na.rm = TRUE)))

# stat test for how much all activities helped
print(paste("Wilcoxon signed-rank to test if difference in self-reported",
            "understanding of PCA before and after all modules equals zero:"))
suppressWarnings(wilcox.test(total_diff))# cleaner output
