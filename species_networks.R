library(netassoc)

set.seed(1)

# Observed m x n community matrix (abundance or presence/absence)
m_obs <- trimmedwide %>%
  ungroup() %>%
  #select(-c(SampID, poriferaencrusting, sabellidae, ophiuroidea)) %>%
  select(indsp) %>%
  filter(rowSums(.)>0)%>%
  t()

# Number of m species
nsp <- 74
# Number of n sites
nsi <- dim(m_obs)[2]


# Null expected m x n community matrix (abundance or presence/absence)
m_nul <- floor(matrix(rpois(nsp*nsi,lambda=5),ncol=nsi,nrow=nsp))

# What species co-occurrence patterns are more or less likely than expected under the null model?
n <- make_netassoc_network(m_obs, m_nul,
                           method="partial_correlation",
                           args=list(method="shrinkage"), # for alternative estimators see ?partial_correlation
                           p.method='fdr', 
                           numnulls=100, 
                           plot=TRUE,
                           alpha=0.05)


netw <- as.data.frame(matrix(n$matrix_spsp_ses_thresholded, ncol = nsp, byrow = TRUE), row.names= indsp)
colnames(netw)<- indsp
