######## Data exploration for AM colonization of San Francisco Matrix trees 

# September 2021
# Kerstin Pierick

# Packages ----------------------------------------
pacman::p_load(readxl, tidyverse)

# Data ---------------------------------------------

am <- read_excel("data/Matrix_SF_root_colonization_2017_TessaCamenzind.xlsx", sheet = "R+markierte(F)") %>%
  select(treeID = Sample_ID, AMF = `AMF_%`)
am

roots <- read_csv("data/alldata_resub.csv") %>%
  mutate(treeID = as.character(treeID))
roots

data <- roots %>%
  left_join(am) %>%
  filter(!is.na(AMF))
data

# Visualization ------------------------------------

data %>%
  select(diameter, srl, rtd, rbi, nroot, AMF) %>%
  corrmorant::corrmorant()
ggsave("correlations.png")
