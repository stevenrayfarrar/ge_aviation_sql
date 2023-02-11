/*
GE_Aviation Data Exploration
Skills used: Creating SQL Tables, CTEs, Unions, Altering Tables, Updating Tables, Creating reusable SQL functions
Done with MySQL 8.0

Sample dataset created from GE Aviation Data Lake schema.
Task is to create a single data set that combines all data listed into a single table.
The original instructions are to perform the operations in either Excel or Tableau, but I wanted to demonstrate how these tasks could also be accomplished using SQL.

The first step is to create a sample tables using portions of the database from the provided excel file. This will make the data easier to work with for demonstrative purposes.

*/

CREATE TABLE av_engine_data_aic_psql
    (`dataset` varchar(11), `esn` int, `unit` int, `flight_cycle` int, `datetime` datetime, `operator` varchar(3), `depart_icao` varchar(4), `destination_icao` varchar(4), `hpc_eff_mod` numeric, `hpc_flow_mod` numeric, `tra` int, `t2` numeric, `t24` numeric, `t30` numeric, `t50` numeric, `p2` numeric, `p15` numeric, `p30` numeric, `nf` numeric, `nc` numeric, `epr` numeric, `ps30` numeric, `phi` numeric, `nrf` numeric, `nrc` numeric, `bpr` numeric, `farb` numeric, `htbleed` int, `nf_dmd` int, `pcnfr_dmd` int, `w31` numeric, `w32` numeric)
;
    
INSERT INTO av_engine_data_aic_psql
    (`dataset`, `esn`, `unit`, `flight_cycle`, `datetime`, `operator`, `depart_icao`, `destination_icao`, `hpc_eff_mod`, `hpc_flow_mod`, `tra`, `t2`, `t24`, `t30`, `t50`, `p2`, `p15`, `p30`, `nf`, `nc`, `epr`, `ps30`, `phi`, `nrf`, `nrc`, `bpr`, `farb`, `htbleed`, `nf_dmd`, `pcnfr_dmd`, `w31`, `w32`)
VALUES
    ('train_FD001', 999001, 1, 1, '2018-01-11 17:10:00', 'AIC', 'VTBS', 'VICG', -5.00E-04, 2.00E-04, 100, 518.67, 182.55, 1584.02, 1402.78, 14.62, 21.61, 554.01, 2388.11, 9053.43, 1.3, 47.41, 521.93, 2388.12, 8130.36, 8.4279, 0.03, 392, 2388, 100, 38.86, 23.4513),
    ('train_FD001', 999001, 1, 2, '2018-01-12 01:07:00', 'AIC', 'VICG', 'VTBS', 0.0016, -3.00E-04, 100, 518.67, 182.54, 1580.41, 1403.09, 14.62, 21.61, 554.06, 2388.03, 9046.09, 1.3, 47.3, 521.72, 2388.09, 8134.28, 8.423, 0.03, 391, 2388, 100, 38.8, 23.3881),
    ('train_FD001', 999001, 1, 3, '2018-01-12 02:06:00', 'AIC', 'VICG', 'VTBS', -0.0017, 1.00E-04, 100, 518.67, 182.74, 1579.25, 1406.81, 14.62, 21.61, 553.76, 2388.07, 9054.42, 1.3, 47.27, 521.97, 2388.09, 8133.95, 8.3951, 0.03, 391, 2388, 100, 38.84, 23.3085),
    ('train_FD001', 999001, 1, 4, '2018-01-12 07:42:00', 'AIC', 'VTBS', 'VIDP', -0.0012, -2.00E-04, 100, 518.67, 182.62, 1592.04, 1397.93, 14.62, 21.61, 553.88, 2388.03, 9049.64, 1.3, 47.29, 522.04, 2388.1, 8129.85, 8.404, 0.03, 391, 2388, 100, 39.03, 23.3975),
    ('train_FD001', 999001, 1, 5, '2018-01-12 08:42:00', 'AIC', 'VTBS', 'VIDP', 0.0027, 1.00E-04, 100, 518.67, 183.29, 1584.65, 1401.48, 14.62, 21.61, 554.03, 2388.07, 9045.85, 1.3, 47.58, 522.25, 2387.97, 8132.67, 8.4135, 0.03, 392, 2388, 100, 38.8, 23.382),
    ('train_FD001', 999001, 1, 6, '2018-01-12 17:11:00', 'AIC', 'VTBS', 'VICG', 9.00E-04, -4.00E-04, 100, 518.67, 182.29, 1582.32, 1394.82, 14.62, 21.61, 553.6, 2388.07, 9042.32, 1.3, 47.22, 521.77, 2388.11, 8130.13, 8.4621, 0.03, 392, 2388, 100, 38.89, 23.3521),
    ('train_FD001', 999001, 1, 7, '2018-01-12 17:47:00', 'AIC', 'VIDP', 'VOBL', -0.0015, 2.00E-04, 100, 518.67, 182.54, 1589.21, 1398.94, 14.62, 21.61, 553.66, 2388.02, 9056.55, 1.3, 47.44, 521.58, 2388.03, 8136.44, 8.3996, 0.03, 390, 2388, 100, 39.02, 23.4428),
    ('train_FD001', 999001, 1, 8, '2018-01-12 18:47:00', 'AIC', 'VIDP', 'VOBL', 0.0022, 4.00E-04, 100, 518.67, 182.88, 1586.3, 1400.97, 14.62, 21.61, 554.61, 2388.06, 9046.44, 1.3, 47.41, 521.6, 2388.08, 8135.25, 8.453, 0.03, 393, 2388, 100, 38.99, 23.275),
    ('train_FD001', 999001, 1, 9, '2018-01-12 21:43:00', 'AIC', 'VOBL', 'VIDP', 0.004, 2.00E-04, 100, 518.67, 182.32, 1580.76, 1404.1, 14.62, 21.61, 553.47, 2388.08, 9042.37, 1.3, 47.4, 522.28, 2388.16, 8133.91, 8.3793, 0.03, 392, 2388, 100, 38.88, 23.3486)
;

CREATE TABLE av_engine_data_fron_psql
    (`dataset` varchar(11), `esn` int, `unit` int, `flight_cycle` int, `datetime` datetime, `operator` varchar(4), `depart_icao` varchar(4), `destination_icao` varchar(4), `hpc_eff_mod` numeric, `hpc_flow_mod` numeric, `tra` int, `t2` numeric, `t24` numeric, `t30` numeric, `t50` numeric, `p2` numeric, `p15` numeric, `p30` numeric, `nf` int, `nc` numeric, `epr` numeric, `ps30` numeric, `phi` numeric, `nrf` numeric, `nrc` numeric, `bpr` numeric, `farb` numeric, `htbleed` int, `nf_dmd` int, `pcnfr_dmd` int, `w31` numeric, `w32` numeric)
;
    
INSERT INTO av_engine_data_fron_psql
    (`dataset`, `esn`, `unit`, `flight_cycle`, `datetime`, `operator`, `depart_icao`, `destination_icao`, `hpc_eff_mod`, `hpc_flow_mod`, `tra`, `t2`, `t24`, `t30`, `t50`, `p2`, `p15`, `p30`, `nf`, `nc`, `epr`, `ps30`, `phi`, `nrf`, `nrc`, `bpr`, `farb`, `htbleed`, `nf_dmd`, `pcnfr_dmd`, `w31`, `w32`)
VALUES
    ('train_FD001', 999050, 50, 1, '2018-01-06 06:01:00', 'FRON', 'KMCO', 'KMSY', -0.0029, -0.0002, 100, 518.67, 642.66, 1591.79, 1401.3, 14.62, 21.6, 554.6, 2388.01, 9064.12, 1.3, 47.47, 521.68, 2388.06, 8151.49, 8.4158, 0.03, 393, 2388, 100, 38.8, 23.3016),
    ('train_FD001', 999050, 50, 2, '2018-01-06 07:41:00', 'FRON', 'KMSY', 'KSAT', -0.0002, -0.0005, 100, 518.67, 642.28, 1587.84, 1404.96, 14.62, 21.61, 553.6, 2388.06, 9065.83, 1.3, 47.33, 522.12, 2388.07, 8142.72, 8.4467, 0.03, 392, 2388, 100, 38.99, 23.344),
    ('train_FD001', 999050, 50, 3, '2018-01-06 08:41:00', 'FRON', 'KMSY', 'KSAT', -0.001, -0.0005, 100, 518.67, 642.21, 1586.89, 1404.47, 14.62, 21.61, 554.31, 2388.05, 9065.63, 1.3, 47.48, 521.96, 2388.05, 8139.14, 8.4424, 0.03, 393, 2388, 100, 38.91, 23.319),
    ('train_FD001', 999050, 50, 4, '2018-01-06 10:14:00', 'FRON', 'KSAT', 'KSAN', -0.0061, -0.0002, 100, 518.67, 643.19, 1587.36, 1398.9, 14.62, 21.61, 554.35, 2388.07, 9059.91, 1.3, 47.3, 522.31, 2388.04, 8145.16, 8.4504, 0.03, 393, 2388, 100, 38.95, 23.3161),
    ('train_FD001', 999050, 50, 5, '2018-01-06 11:12:00', 'FRON', 'KSAT', 'KSAN', -0.0002, 0.0001, 100, 518.67, 642.47, 1584.96, 1406.08, 14.62, 21.61, 554.03, 2388, 9073.29, 1.3, 47.44, 522.05, 2388.05, 8145.35, 8.3822, 0.03, 392, 2388, 100, 38.83, 23.3256),
    ('train_FD001', 999050, 50, 6, '2018-01-06 14:21:00', 'FRON', 'KSAN', 'KSAT', -0.0003, -0.0003, 100, 518.67, 641.82, 1585.3, 1399.3, 14.62, 21.61, 554.38, 2388.02, 9068.48, 1.3, 47.13, 522.17, 2388.04, 8144.13, 8.418, 0.03, 393, 2388, 100, 38.8, 23.4777),
    ('train_FD001', 999050, 50, 7, '2018-01-06 15:20:00', 'FRON', 'KSAN', 'KSAT', 0.0026, -0.0005, 100, 518.67, 642.39, 1589.71, 1410.22, 14.62, 21.61, 553.41, 2388.07, 9065.43, 1.3, 47.32, 522.44, 2388.07, 8142.57, 8.4232, 0.03, 393, 2388, 100, 38.7, 23.3443),
    ('train_FD001', 999050, 50, 8, '2018-01-06 18:38:00', 'FRON', 'KSAT', 'KMSY', 0.0011, 0.0002, 100, 518.67, 642.07, 1590.7, 1403.72, 14.62, 21.61, 553.84, 2388.04, 9059.48, 1.3, 47.43, 521.9, 2388.08, 8145.86, 8.4063, 0.03, 393, 2388, 100, 38.89, 23.3815),
    ('train_FD001', 999050, 50, 9, '2018-01-06 20:46:00', 'FRON', 'KMSY', 'KMCO', 0.0005, -0.0001, 100, 518.67, 641.8, 1592.23, 1401.26, 14.62, 21.61, 553.56, 2388.02, 9059.32, 1.3, 47.19, 521.73, 2388.04, 8142.33, 8.3988, 0.03, 390, 2388, 100, 38.95, 23.3749)
;

CREATE TABLE av_engine_data_axm_psql
    (`dataset` varchar(10), `esn` int, `unit` int, `flight_cycle` int, `datetime` numeric, `operator` varchar(3), `depart_icao` varchar(4), `destination_icao` varchar(4), `hpc_eff_mod` numeric, `hpc_flow_mod` numeric, `tra` int, `t2` numeric, `t24` int, `t30` numeric, `t50` numeric, `p2` numeric, `p15` numeric, `p30` numeric, `nf` numeric, `nc` numeric, `epr` numeric, `ps30` numeric, `phi` numeric, `nrf` int, `nrc` numeric, `bpr` numeric, `farb` numeric, `htbleed` int, `nf_dmd` int, `pcnfr_dmd` int, `w31` numeric, `w32` numeric)
;
    
INSERT INTO av_engine_data_axm_psql
    (`dataset`, `esn`, `unit`, `flight_cycle`, `datetime`, `operator`, `depart_icao`, `destination_icao`, `hpc_eff_mod`, `hpc_flow_mod`, `tra`, `t2`, `t24`, `t30`, `t50`, `p2`, `p15`, `p30`, `nf`, `nc`, `epr`, `ps30`, `phi`, `nrf`, `nrc`, `bpr`, `farb`, `htbleed`, `nf_dmd`, `pcnfr_dmd`, `w31`, `w32`)
VALUES
    ('test_FD001', 999126, 26, 1, 43100.773, 'AXM', 'VTBD', 'VTUV', -0.0027, 0.0006, 100, 518.67, 642, 1582.88, 1399.92, 14.62, 21.61, 554.54, 2388.02, 9060.88, 1.3, 47.38, 522.55, 2387.98, 8147.17, 8.3468, 0.03, 392, 2388, 100, 38.82, 23.3876),
    ('test_FD001', 999126, 26, 2, 43100.83321, 'AXM', 'VTUV', 'VTBD', -0.0029, 0.0002, 100, 518.67, 642.35, 1589.01, 1398.46, 14.62, 21.61, 554.11, 2387.96, 9063.16, 1.3, 47.21, 521.85, 2388.01, 8146.58, 8.4159, 0.03, 390, 2388, 100, 39, 23.3793),
    ('test_FD001', 999126, 26, 3, 43100.906, 'AXM', 'VTBD', 'VMMC', 0.0008, 0.0001, 100, 518.67, 642.69, 1590.16, 1398.4, 14.62, 21.61, 554.39, 2387.99, 9057.29, 1.3, 47.16, 522.34, 2388.05, 8144.6, 8.4444, 0.03, 391, 2388, 100, 39.2, 23.339),
    ('test_FD001', 999126, 26, 4, 43101.03475, 'AXM', 'VMMC', 'VTBD', -0.0026, 0.0005, 100, 518.67, 641.76, 1583.37, 1389.66, 14.62, 21.61, 553.59, 2387.99, 9064.94, 1.3, 47.19, 522.03, 2388, 8147.98, 8.3986, 0.03, 392, 2388, 100, 38.97, 23.3931),
    ('test_FD001', 999126, 26, 5, 43101.1844, 'AXM', 'VTBD', 'VTSP', 0.002, 0.0005, 100, 518.67, 642.54, 1591.71, 1403.84, 14.62, 21.61, 554.51, 2388.01, 9062.58, 1.3, 47.38, 522.04, 2388, 8142.07, 8.4332, 0.03, 391, 2388, 100, 39.11, 23.3904),
    ('test_FD001', 999126, 26, 6, 43101.26801, 'AXM', 'VTSP', 'VTBD', -0.0032, -0.0001, 100, 518.67, 641.98, 1592.68, 1396.83, 14.62, 21.61, 554.44, 2388, 9061.77, 1.3, 47.4, 522.3, 2387.98, 8145.16, 8.4348, 0.03, 392, 2388, 100, 38.83, 23.3659),
    ('test_FD001', 999126, 26, 7, 43101.35909, 'AXM', 'VTBD', 'VTCC', 0.0009, 0.0003, 100, 518.67, 642.06, 1583.81, 1395.99, 14.62, 21.61, 553.65, 2388.02, 9063.44, 1.3, 47.29, 522.5, 2388.09, 8140.98, 8.4034, 0.03, 392, 2388, 100, 38.97, 23.4343),
    ('test_FD001', 999126, 26, 8, 43102.3701, 'AXM', 'VTBD', 'VOTR', 0.0035, 0.0004, 100, 518.67, 642.06, 1583.4, 1402.21, 14.62, 21.61, 554.12, 2388.03, 9064.77, 1.3, 47.13, 522.02, 2388.02, 8138.82, 8.3913, 0.03, 392, 2388, 100, 38.89, 23.3488),
    ('test_FD001', 999126, 26, 9, 43105.10903, 'AXM', 'VTBD', 'WSSS', -0.0012, -0.0001, 100, 518.67, 641.68, 1587.24, 1405.59, 14.62, 21.61, 553.93, 2388.04, 9061.31, 1.3, 47.28, 522.36, 2388.04, 8145.24, 8.4326, 0.03, 393, 2388, 100, 38.96, 23.4282)
;

CREATE TABLE av_engine_data_pgt_psql
    (`dataset` varchar(11), `esn` int, `unit` int, `flight_cycle` int, `datetime` numeric, `operator` varchar(3), `depart_icao` varchar(4), `destination_icao` varchar(4), `hpc_eff_mod` numeric, `hpc_flow_mod` numeric, `tra` int, `t2` numeric, `t24` numeric, `t30` numeric, `t50` numeric, `p2` numeric, `p15` numeric, `p30` numeric, `nf` numeric, `nc` numeric, `epr` numeric, `ps30` numeric, `phi` numeric, `nrf` numeric, `nrc` numeric, `bpr` numeric, `farb` numeric, `htbleed` int, `nf_dmd` int, `pcnfr_dmd` int, `w31` int, `w32` numeric)
;
    
INSERT INTO av_engine_data_pgt_psql
    (`dataset`, `esn`, `unit`, `flight_cycle`, `datetime`, `operator`, `depart_icao`, `destination_icao`, `hpc_eff_mod`, `hpc_flow_mod`, `tra`, `t2`, `t24`, `t30`, `t50`, `p2`, `p15`, `p30`, `nf`, `nc`, `epr`, `ps30`, `phi`, `nrf`, `nrc`, `bpr`, `farb`, `htbleed`, `nf_dmd`, `pcnfr_dmd`, `w31`, `w32`)
VALUES
    ('train_FD001', 999056, 56, 1, 43101.27307, 'PGT', 'LTBJ', 'LTCR', 0.0012, -0.0004, 100, 518.67, 642.75, 1586.44, 1412.72, 14.62, 21.61, 552.68, 2388.1, 9059.1, 1.3, 47.72, 521.18, 2388.13, 8136.92, 8.4412, 0.03, 395, 2388, 100, 38.81, 23.2391),
    ('train_FD001', 999056, 56, 2, 43101.40302, 'PGT', 'LTCR', 'LTBJ', 0.0012, -0.0004, 100, 518.67, 642.47, 1584.96, 1410.405, 14.62, 21.61, 552.9, 2388.12, 9057.99, 1.3, 47.42, 520.82, 2388.08, 8133.11, 8.4461, 0.03, 394, 2388, 100, 38.82, 23.334),
    ('train_FD001', 999056, 56, 3, 43101.51598, 'PGT', 'LTBJ', 'LTFJ', 0.0026, 0.0005, 100, 518.67, 642.52, 1587.64, 1403.7, 14.62, 21.61, 553.52, 2388.13, 9054.91, 1.3, 47.48, 521.7, 2388.12, 8136.86, 8.4357, 0.03, 394, 2388, 100, 38.89, 23.2844),
    ('train_FD001', 999056, 56, 4, 43101.59109, 'PGT', 'LTFJ', 'LTCG', 0.0034, -0.0002, 100, 518.67, 642.51, 1587.8, 1410.585, 14.62, 21.61, 553.6, 2388.13, 9045.3, 1.3, 47.49, 522.06, 2388.18, 8132.53, 8.4411, 0.03, 394, 2388, 100, 38.79, 23.3204),
    ('train_FD001', 999056, 56, 5, 43101.88252, 'PGT', 'LTCG', 'LTFJ', 0.0024, -0.0001, 100, 518.67, 643.08, 1593.15, 1401.46, 14.62, 21.61, 553.45, 2388.03, 9046.37, 1.3, 47.67, 521.36, 2388.16, 8133.47, 8.4824, 0.03, 394, 2388, 100, 39, 23.3592),
    ('train_FD001', 999056, 56, 6, 43102.00638, 'PGT', 'LTFJ', 'LTCN', 0.001, -0.0002, 100, 518.67, 642.52, 1589.19, 1408.88, 14.62, 21.61, 553.22, 2388.12, 9054.19, 1.3, 47.77, 520.98, 2388.13, 8132.14, 8.4382, 0.03, 393, 2388, 100, 38.83, 23.2568),
    ('train_FD001', 999056, 56, 7, 43102.08346, 'PGT', 'LTCN', 'LTFJ', -0.0033, 0.0001, 100, 518.67, 642.73, 1585.09, 1405.88, 14.62, 21.61, 552.52, 2388.12, 9049.44, 1.3, 47.63, 520.83, 2388.1, 8128.3, 8.4429, 0.03, 394, 2388, 100, 38.86, 23.1591),
    ('train_FD001', 999056, 56, 8, 43102.17942, 'PGT', 'LTFJ', 'LTCE', 0.0027, -0.0003, 100, 518.67, 643.07, 1586, 1409.73, 14.62, 21.61, 552.68, 2388.09, 9054.87, 1.3, 47.67, 521.14, 2388.11, 8130.56, 8.4567, 0.03, 392, 2388, 100, 38.79, 23.2923),
    ('train_FD001', 999056, 56, 9, 43102.26966, 'PGT', 'LTCE', 'LTFJ', -0.0031, -0.0001, 100, 518.67, 642.56, 1591.69, 1409.36, 14.62, 21.61, 552.76, 2388.1, 9058.91, 1.3, 47.53, 521.23, 2388.12, 8129.56, 8.403, 0.03, 394, 2388, 100, 38.96, 23.2503)
;

/* INSTRUCTIONS: The airline stored the data in the t24 column in Rankine, but other airlines kept their temperatures in Standard format.
Combine the data so that all three tables are stored in one dataset.
Clean the data so that our dataset can be used when referencing data from other airlines.

You may want to create a cte with UNION statements inside, but because UNION takes two queries and makes them one, and creating a cte defines a new query you cannot use UNION within a WITH statement as the beginning of the UNION query will end the WITH query.
To get around this, I want to create a query that defines the ctes based on what I need to change in the original datasets and combine them using the UNION queries at the end.

*/
WITH cte_aic AS
(
SELECT *
FROM av_engine_data_aic_psql
),

cte_fron AS
(
SELECT *
FROM av_engine_data_fron_psql
),

cte_axm AS
(
SELECT * FROM av_engine_data_axm_psql
),

cte_pgt AS
(
SELECT * FROM av_engine_data_pgt_psql
)

SELECT * FROM cte_aic
UNION
SELECT * FROM cte_fron
UNION
SELECT * FROM cte_axm
UNION
SELECT * FROM cte_pgt

-- Now that we have our outline to manipulate our tables, we can begin to alter the ctes to reach our goals.

WITH cte_aic AS
(
SELECT *, (t24 + 459.67) AS t24_adjusted
FROM av_engine_data_aic_psql
),

cte_fron AS
(
SELECT *, (t24 + 459.67) AS t24_adjusted
FROM av_engine_data_fron_psql
),

cte_axm AS
(
SELECT *, (t24 + 459.67) AS t24_adjusted
FROM av_engine_data_axm_psql
),

cte_pgt AS
(
SELECT *, (t24 + 459.67) AS t24_adjusted
FROM av_engine_data_pgt_psql
)

SELECT * FROM cte_aic
UNION
SELECT * FROM cte_fron
UNION
SELECT * FROM cte_axm
UNION
SELECT * FROM cte_pgt

-- Now that we have tested our query and tested it for errors, we need to rename the original t24 column in our database.

ALTER TABLE av_engine_data_aic_psql
RENAME COLUMN t24 TO t24_original,
ADD t24_adjusted FLOAT;

UPDATE av_engine_data_aic_psql
SET t24_adjusted = (t24_original + 459.67);

SELECT * FROM av_engine_data_aic_psql

-- We could then apply this query to each of our other tables and combine them to create a new dataset.
