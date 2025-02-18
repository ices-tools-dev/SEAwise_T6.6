library(jsonlite)

options <- list(
  criteria = list(
    ssb = list(
      weight = 1,
      sub_criteria = list(
        ARA181920 = list(weight = 1, function_ = "logistic2p", ref_points = c(167/2., 167., 0.1, 0.5)),
        ARS181920 = list(weight = 1, function_ = "logistic2p", ref_points = c(563/2., 563., 0.1, 0.5)),
        DPS171819 = list(weight = 1, function_ = "logistic2p", ref_points = c(1455., 4850., 0.1, 0.99)),
        HKE1718 = list(weight = 1, function_ = "logistic2p", ref_points = c(26188., 104752., 0.1, 0.99)),
        HKE19 = list(weight = 1, function_ = "logistic2p", ref_points = c(1924./2., 1924., 0.1, 0.5)),
        MUT1718 = list(weight = 1, function_ = "logistic2p", ref_points = c(3198., 12791., 0.1, 0.99)),
        MUT19 = list(weight = 1, function_ = "logistic2p", ref_points = c(742./2., 742., 0.1, 0.5)),
        NEP17 = list(weight = 1, function_ = "logistic2p", ref_points = c(381., 761., 0.1, 0.99)),
        NEP18 = list(weight = 1, function_ = "logistic2p", ref_points = c(737/2., 737., 0.1, 0.5)),
        SOL17 = list(weight = 1, function_ = "logistic2p", ref_points = c(1943., 3887., 0.1, 0.99))
      ),
      function_ = NULL,
      ref_points = NULL
    ),
    f = list(
      weight = 1,
      sub_criteria = list(
        ARA181920 = list(weight = 1, function_ = "logistic2p", ref_points = c(0.206, 0.206*2, 0.99, 0.1)),
        ARS181920 = list(weight = 1, function_ = "logistic2p", ref_points = c(0.37, 0.37*2, 0.99, 0.1)),
        DPS171819 = list(weight = 1, function_ = "logistic2p", ref_points = c(0.937, 0.937*2, 0.99, 0.1)),
        HKE1718 = list(weight = 1, function_ = "logistic2p", ref_points = c(0.231, 0.231*2, 0.99, 0.1)),
        HKE19 = list(weight = 1, function_ = "logistic2p", ref_points = c(0.211, 0.211*2, 0.99, 0.1)),
        MUT1718 = list(weight = 1, function_ = "logistic2p", ref_points = c(0.306, 0.306*2, 0.99, 0.1)),
        MUT19 = list(weight = 1, function_ = "logistic2p", ref_points = c(0.380, 0.380*2, 0.99, 0.1)),
        NEP17 = list(weight = 1, function_ = "logistic2p", ref_points = c(0.418, 0.418*2, 0.99, 0.1)),
        NEP18 = list(weight = 1, function_ = "logistic2p", ref_points = c(0.14, 0.14*2, 0.99, 0.1)),
        SOL17 = list(weight = 1, function_ = "logistic2p", ref_points = c(0.209, 0.209*2, 0.99, 0.1))
      ),
      function_ = NULL,
      ref_points = NULL
    ),
    employment = list(weight = 1, sub_criteria = NULL, function_ = "logistic2p", ref_points = c(890.2315/2, 890.2315, 0.1, 0.5)),
    wage = list(weight = 1, sub_criteria = NULL, function_ = "logistic2p", ref_points = c(3469243.237/2, 3469243.237, 0.1, 0.5)),
    gva = list(weight = 1, sub_criteria = NULL, function_ = "logistic2p", ref_points = c(7890277.182/2, 7890277.182, 0.1, 0.5)),
    rsl = list(weight = 1, sub_criteria = NULL, function_ = "beta1p", ref_points = c(0.412670939, 4)),
    co2 = list(weight = 1, sub_criteria = NULL, function_ = "logistic2p", ref_points = c(1, 331.3682923, 0.99, 0.5)),
    mml = list(weight = 1, sub_criteria = NULL, function_ = "logistic2p", ref_points = c(46.20/2, 46.20, 0.1, 0.5)),
    apex_pred = list(weight = 1, sub_criteria = NULL, function_ = "logistic2p", ref_points = c(590.15/2, 590.15, 0.1, 0.5)),
    rbs = list(weight = 1, sub_criteria = NULL, function_ = "logistic2p", ref_points = c(64.63/2, 64.63, 0.1, 0.5))
  ),
  data = list(
    ssb = "data/MCDA_stock_med.csv",
    f = "data/MCDA_stock_med.csv",
    employment = "data/MCDA_socioeco_med.csv",
    wage = "data/MCDA_socioeco_med.csv",
    gva = "data/MCDA_socioeco_med.csv",
    rsl = "data/MCDA_socioeco_med.csv",
    co2 = "data/MCDA_socioeco_med.csv",
    mml = "data/MCDA_biodiv_med.csv",
    apex_pred = "data/MCDA_biodiv_med.csv",
    rbs = "data/MCDA_habitats_med.csv"
  )
)

write_json(options, "data/MCDA_options.json", pretty = TRUE)
