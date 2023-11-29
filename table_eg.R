
```{r 10-statetable, echo=FALSE, message=FALSE, warning=FALSE}
library(knitr)
library(kableExtra)
library(readxl)
library(rmarkdown)
theSheet <- read_excel('tables/peel_tables.xlsx', sheet = 1)
theSheet <- theSheet[theSheet$Table == "State variable",]
theSheetGroups <- unique(theSheet$Group)
theSheet$`AED name` <- paste0("`",theSheet$`AED name`,"`")

for(i in seq_along(theSheet$Symbol)){
  if(!is.na(theSheet$Symbol[i])==TRUE){
    theSheet$Symbol[i] <- paste0("$$",theSheet$Symbol[i],"$$")
  } else {
    theSheet$Symbol[i] <- NA
  }
}
for(i in seq_along(theSheet$Unit)){
  if(!is.na(theSheet$Unit[i])==TRUE){
    theSheet$Unit[i] <- paste0("$$\\small{",theSheet$Unit[i],"}$$")
  } else {
    theSheet$Unit[i] <- NA
  }
}
for(i in seq_along(theSheet$Comments)){
  if(!is.na(theSheet$Comments[i])==TRUE){
    theSheet$Comments[i] <- paste0("",theSheet$Comments[i],"")
  } else {
    theSheet$Comments[i] <- " "
  }
}

kbl(theSheet[,3:NCOL(theSheet)], caption = "Oxygen - state variables", align = "l",) %>%
  pack_rows(theSheetGroups[1],
            min(which(theSheet$Group == theSheetGroups[1])),
            max(which(theSheet$Group == theSheetGroups[1])),
            background = '#ebebeb') %>%
  pack_rows(theSheetGroups[2],
            min(which(theSheet$Group == theSheetGroups[2])),
            max(which(theSheet$Group == theSheetGroups[2])),
            background = '#ebebeb') %>%
  row_spec(0, background = "#14759e", bold = TRUE, color = "white") %>%
  kable_styling(full_width = F,font_size = 11) %>%
  column_spec(2, width_min = "7em") %>%
  column_spec(3, width_max = "18em") %>%
  column_spec(4, width_min = "10em") %>%
  column_spec(5, width_min = "5em") %>%
  column_spec(7, width_min = "10em") %>%
  column_spec(7, width_max = "20em") %>%
  scroll_box(width = "770px", height = "200px",
             fixed_thead = FALSE)
```



which can also include salinity and pressure (table
                                              \@ref(tab:Diff-table)).

<center>
  
  ```{r Diff-table, echo=FALSE, message=FALSE, warning=FALSE}
library(knitr)
library(kableExtra)
library(readxl)
options(knitr.kable.NA = "")
Diff_tab <- read_xlsx("tables/peel_tables.xlsx", sheet="Diffcoef2")
kable(Diff_tab[,1:2],"html", escape = F, align = "c"
      , caption = "Temperature-dependent calculations for diffusivity constants. All state variables in CANDI-AED use the default value, unless specified in this table. The function *a* is a further correction for salinity and pressure.",bootstrap_options = "hover")%>%
  kable_styling(Diff_tab, bootstrap_options = "hover",
                full_width = T, position = "left",
                font_size = 12) %>% 
  
  row_spec(0, background = "#14759e", bold = TRUE, color = "white") %>%
  column_spec(1, width_min = "20em" ,color="black",bold = F) %>%
  column_spec(2, width_min = "20em" ,color="black") %>%
  # column_spec(3, width_min = "15em" ,color="black") %>%
  # row_spec(1:2, background = 'white')  %>%
  scroll_box(width = "40em", height = "20em",fixed_thead = FALSE)
```

