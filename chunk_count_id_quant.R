# ---- Identified and quantified proteins per sample (Excluding new data) ---- 
get_data(which = "Unique.peptides",
         variables = clean,
         observations = !observations %in% c("Anoxic_08_2","Control_02_2", 
                                             "Control_03_2", "Control_06_2", 
                                             "Control_08_2", "Control_09_2", 
                                             "Control_10_2", "Control_11_2", 
                                             "Control_19_2", "Frozen_04_2")) %>%
  include_groups("groups") %>%
  include_observations_data("name") %>%
  do_expr(x > 0) %>%
  put_data(which = "LFQ.intensity") %>%
  include_groups("groups") %>%
  include_observations_data("name") %>%
  do_expr(x > 0) %>%
  do_count_id_quant() %>%
  include_observations_data(which = "name",
                            name = "labels",
                            dataset = 1) %>%
  include_observations_data(which = "groups",
                            name = "groups",
                            dataset = 1) %>%
  plot_count_id_quant(labels = "labels",
                      show.average.line = "groups", 
                      color.by = "groups",
                      color = list(Control = c("#6BAED6", "#2171B5"),
                                   Anoxic = c("#FF7A6C", "#DC381F"),
                                   Dehydrated = c("#6CD36C", "#41A317"),
                                   Frozen = c("#F9B964", "#FFA500"))) %>%
  save_results("Protein_count_old_samples", replace = TRUE)