






View(do_nothing)




# Filter with flexible string declaration

expr <- paste0(groups[1], ">=", lower.pos, "&", groups[2], "<=", upper.neg)

filter(rlang::eval_tidy(rlang::parse_expr(expr)))

# Better use .data[[variable]]
dplyr::mutate(sig = (.data[[x]] != "not") + (.data[[y]] != "not"))


#
data_[[new.name]] <- data_[[data.name]] %>%
  dplyr::group_by(!!dplyr::sym(group.column)) %>%
  dplyr::summarise(across(.cols = where(is.numeric) | where(is.logical), .fns = FUN))



# Add variables with flexible string declaration
mutate(df, !!varname := Petal.Width * n)


# Taking user input
menu()
scan()
select.list()

# Graphical yes no input
utils::askYesNo()


# Nice table
DT::datatable()



# Modify pdf files https://github.com/pridiltal/staplr
#library(staplr)


# Call library from string
keytypes(eval(parse(text = "org.Mm.eg.db")))





# Close pdf viewer
system('taskkill /f /im AcroRd32.exe')

# Open pdf file
system(paste0('open "', file, '"'))





# gglabeller

library(gglabeller)
library(ggplot2)
library(ggrepel)



gglabeller_example <- gglabeller(p, aes(label = p[["data"]][["variables"]]))




# Change names of annotations
if (length(names(TERMS)) > 0) {

  names(TERMS)[names(TERMS) == ""] <- TERMS[names(TERMS) == ""]

  data.melt$TERM <- names(TERMS)[match(data.melt$TERM, TERMS)]

}




### ggplot2 magic

# Handle legends
gg_legend.position(p)

legend <- gg_extract_legend(p)




for (i in list.files()) {

  if (grepl("nico", i))
    file.rename(from = i, to = substring(i, 6))

}







