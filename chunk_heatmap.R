# ---- Heatmap (Excluding new samples) ----
get_data(which = "LFQ.intensity",
         variables = ,
         observations = ) %>% 
  remove_variables(min = 0.5) %>% 
  impute_norm() %>% 
  include_groups(groups = "groups") %>% 
  do_hclust(plot = F) %>% 
  plot_heatmap(annot_layer_x = "groups", 
               legends = c("annot_layer_x_groups", "heatmap"), 
               annotation.colors = 
                 list(groups = c("#DC381F", "#2171B5", "#41A317", "#FFA500"))) %>% 
  save_results("Heatmap_old_samples", replace = T)