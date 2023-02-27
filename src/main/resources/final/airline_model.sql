-- 流量模型特征表
INSERT INTO %1$s (SKEY, FLIGHT_DATE, INSERT_DATE, COMP, EQT, FLTNO, DEPTIME, ARRTIME, DEP, ARR, CAP, MAX, EX_DIF, IST_HOUR, OD, BKD, LKZK, REST, KZL, DEPWEEK, TIME_PD, TRANSIT, HAO, "HOUR", DEP_MINUTE, ARR_TIME, ARR_MINUTE, FLYHOURS, HX, "YEAR", "MONTH", WEEK, STD_PRICE, SUM_INCOME, SUM_INCOME_NEW, HDLX, DISTANCE, ZGLSR, HOLIDAY, MEMO, AIR, EQT_CODE, FLIGHTNO, UP_CITY_CODE, DIS_CITY_CODE, HX_CODE, OD_CODE, FLY_TIME, Y_CABIN_P, NUMOFSOLD, CABINS, PRICEARR, FINAL_DEMAND, D0_KZL, DEMAND, D0_PRICEARR, DIFF_IST_HOUR, DETAIL_DIFF_BKD, BKD_SUM, HIS_1, HIS_2, HIS_3, HIS_4, HIS_5, HIS_6, HIS_7, YOY_DATE, YOY_BKD, YOY_REST, YOY_BKD_SUM, YOY_DETAIL_DIFF_BKD, YOY_NUMOFSOLD, YOY_PRICEARR, YOY_FINAL_DEMAND, YOY_DEMAND, YOY_KZL, YOY_D0_KZL, WOW_FLIGHT_NO, YOY_BKD_1, YOY_REST_1, YOY_DIFF_BKD_1, YOY_D0_KZL_1, YOY_KZL_1, YOY_BKD_2, YOY_REST_2, YOY_DIFF_BKD_2, YOY_D0_KZL_2, YOY_KZL_2, YOY_BKD_3, YOY_REST_3, YOY_DIFF_BKD_3, YOY_D0_KZL_3, YOY_KZL_3, DEP_LONGITUDE, DEP_LATITUDE, ARR_LONGITUDE, ARR_LATITUDE, FLY_SEASON, CANCEL_BKG, AFFIRM_BKG, CAPACITY_P, CAPACITY, OD_MARKET_PER, CAP_P, CAP_SUM, COM_MARKET_PER, CAP_C, CAP_COUNT, AREA_MARKET_PER, KZL_P, REST_P, KZL_HIS_1, KZL_HIS_2, KZL_HIS_3, KZL_HIS_4, KZL_HIS_5, KZL_HIS_6, KZL_HIS_7, DETAIL_DIFF_BKD_1, DETAIL_PRICE, DETAIL_BKD, LABEL, TOP_1, TOP_2, TOP_3, TOP_4, TOP_5, TOP_6, FEA_HR_CLASS, AIRCODE_CLASS, FEA_NEAREST_TIME_1, FEA_NEAREST_TIME_2, FEA_DELT_DEPTIME, TOP_MEAN, TOP_MAX, TOP_MIN, TOP_STD, FLIGHTS_SELF, FLIGHTS_TOTAL, POWER, FLIGHT_TYPE_CODE, SINGLE_LEG_TIME, AC_SINGLE_LEG_TIME, LAST_3_FLY_NUM, LAST_3_FLY_COUNT, LAST_3_FLY_RATE, LAST_2_FLY_NUM, LAST_2_FLY_COUNT, LAST_2_FLY_RATE, LAST_1_FLY_NUM, LAST_1_FLY_COUNT, LAST_1_FLY_RATE, FLY_NUM, FLY_COUNT, FLY_RATE, AFTER_1_FLY_NUM, AFTER_1_FLY_COUNT, AFTER_1_FLY_RATE, AFTER_2_FLY_NUM, AFTER_2_FLY_COUNT, AFTER_2_FLY_RATE, AFTER_3_FLY_NUM, AFTER_3_FLY_COUNT, AFTER_3_FLY_RATE, JF_TYPE, JF_FLIGHT_NO, JF_FEA_HR, JF_COM_MARKET_PER, JF_CAPACITY_P, JF_OD_MARKET_PER, JF_KZL, JF_FEA_FLIGHT_NO, JF_AIRCODE_CLASS, JF_PRICE, PRICE_GAP, JF_SINGLE_LEG_TIME, JF_AC_SINGLE_LEG_TIME, JF_DEP, JF_ARR, CREATE_TIME, CLSN, CLSN_MAX, CLSN_CAP, CLSN_BKD, ID)
SELECT t.*, %6$s.Nextval
FROM (
    -- 找出ANALY_OTA_MERGE_FEATURE中时间符合算法的数据
    WITH t_0 AS (
        SELECT t.*,
            %2$s
        FROM %3$s t
        LEFT JOIN (
            SELECT FLIGHT_DATE, FLIGHT_NO, DEP, ARR, CAST(COLLECT(COLLECT_DATE(CREATE_TIME)) AS COLLECT_DATES) AS CREATE_TIMES
            FROM %4$s
            GROUP BY FLIGHT_DATE, FLIGHT_NO, DEP, ARR
        ) t1
        ON t.FLIGHT_DATE = t1.FLIGHT_DATE AND t.DEP = t1.DEP AND t.ARR = t1.ARR AND t.FLTNO = t1.FLIGHT_NO
    ),
    -- 匹配上ANALY_OTA_MERGE_FEATURE的特征
    t_1 AS (
        SELECT t.SKEY, t.FLIGHT_DATE, t.INSERT_DATE, t.COMP, t.EQT, t.FLTNO, t.DEPTIME, ARRTIME, t.DEP, t.ARR, t.CAP, t.MAX, t.EX_DIF,
            t.IST_HOUR, t.OD, t.BKD, LKZK, t.REST, t.KZL, DEPWEEK, TIME_PD, TRANSIT, HAO, "HOUR", DEP_MINUTE, ARR_TIME,
            ARR_MINUTE, FLYHOURS, t.HX, YEAR, MONTH, WEEK, t.STD_PRICE, t.SUM_INCOME, SUM_INCOME_NEW, t.HDLX,
            t.DISTANCE, t.ZGLSR, t.HOLIDAY, t.MEMO, AIR, t.EQT_CODE, FLIGHTNO, UP_CITY_CODE, DIS_CITY_CODE, HX_CODE, OD_CODE,
            t.FLY_TIME, Y_CABIN_P, NUMOFSOLD, CABINS, PRICEARR, FINAL_DEMAND, D0_KZL, DEMAND, D0_PRICEARR,
            DIFF_IST_HOUR, DETAIL_DIFF_BKD, BKD_SUM, HIS_1, HIS_2, HIS_3, HIS_4, HIS_5, HIS_6, HIS_7, t.YOY_DATE,
            t.YOY_BKD, t.YOY_REST, YOY_BKD_SUM, YOY_DETAIL_DIFF_BKD, YOY_NUMOFSOLD, YOY_PRICEARR, YOY_FINAL_DEMAND,
            YOY_DEMAND, YOY_KZL, YOY_D0_KZL, WOW_FLIGHT_NO, YOY_BKD_1, YOY_REST_1, YOY_DIFF_BKD_1, YOY_D0_KZL_1, YOY_KZL_1,
            YOY_BKD_2, YOY_REST_2, YOY_DIFF_BKD_2, YOY_D0_KZL_2, YOY_KZL_2, YOY_BKD_3, YOY_REST_3, YOY_DIFF_BKD_3,
            YOY_D0_KZL_3, YOY_KZL_3, DEP_LONGITUDE, DEP_LATITUDE, ARR_LONGITUDE, ARR_LATITUDE, FLY_SEASON,
            CANCEL_BKG, AFFIRM_BKG, t.CAPACITY_P, t.CAPACITY, t.OD_MARKET_PER, t.CAP_P, t.CAP_SUM, t.COM_MARKET_PER, t.CAP_C,
            t.CAP_COUNT, t.AREA_MARKET_PER, t.KZL_P, t.REST_P, t.KZL_HIS_1, t.KZL_HIS_2, t.KZL_HIS_3, t.KZL_HIS_4, t.KZL_HIS_5, t.KZL_HIS_6,
            t.KZL_HIS_7, DETAIL_DIFF_BKD_1, DETAIL_PRICE, DETAIL_BKD, LABEL, TOP_1, TOP_2, TOP_3, TOP_4, TOP_5, TOP_6,
            FEA_HR_CLASS, AIRCODE_CLASS, FEA_NEAREST_TIME_1, FEA_NEAREST_TIME_2, FEA_DELT_DEPTIME, TOP_MEAN,
            TOP_MAX, TOP_MIN, TOP_STD, FLIGHTS_SELF, FLIGHTS_TOTAL, POWER, FLIGHT_TYPE_CODE, SINGLE_LEG_TIME,
            AC_SINGLE_LEG_TIME, LAST_3_FLY_NUM, LAST_3_FLY_COUNT, LAST_3_FLY_RATE, LAST_2_FLY_NUM, LAST_2_FLY_COUNT,
            LAST_2_FLY_RATE, LAST_1_FLY_NUM, LAST_1_FLY_COUNT, LAST_1_FLY_RATE, FLY_NUM, FLY_COUNT, FLY_RATE,
            AFTER_1_FLY_NUM, AFTER_1_FLY_COUNT, AFTER_1_FLY_RATE, AFTER_2_FLY_NUM, AFTER_2_FLY_COUNT,
            AFTER_2_FLY_RATE, AFTER_3_FLY_NUM, AFTER_3_FLY_COUNT, AFTER_3_FLY_RATE, JF_TYPE, JF_FLIGHT_NO,
            JF_FEA_HR, JF_COM_MARKET_PER, JF_CAPACITY_P, JF_OD_MARKET_PER, JF_KZL, JF_FEA_FLIGHT_NO,
            JF_AIRCODE_CLASS, JF_PRICE, PRICE_GAP, JF_SINGLE_LEG_TIME, JF_AC_SINGLE_LEG_TIME, JF_DEP, JF_ARR,
            CREATE_TIME, CLSN, CLSN_MAX, CLSN_CAP, CLSN_BKD
        FROM t_0 t
        LEFT JOIN %5$s t1
        ON t.FLIGHT_DATE = t1.FLIGHT_DATE AND t.DEP = t1.DEP AND t.ARR = t1.ARR AND t.fltno = t1.FLIGHT_NO AND t.nearTime = t1.create_time
    ),
    t_2 AS (
        SELECT t.*
        FROM (
            SELECT t1.*, row_number() OVER(PARTITION BY FLIGHT_DATE, FLTNO, DEP, ARR, EX_DIF, ist_Hour ORDER BY INSERT_DATE DESC) rn
            FROM t_1 t1
        ) t
        WHERE t.rn = 1
    )
    SELECT SKEY, FLIGHT_DATE, INSERT_DATE, COMP, EQT, FLTNO, DEPTIME, ARRTIME, DEP, ARR, CAP, MAX, EX_DIF, IST_HOUR, OD, BKD,
        LKZK, REST, KZL, DEPWEEK, TIME_PD, TRANSIT, HAO, "HOUR", DEP_MINUTE, ARR_TIME, ARR_MINUTE, FLYHOURS, HX, "YEAR",
        "MONTH", WEEK, STD_PRICE, SUM_INCOME, SUM_INCOME_NEW, HDLX, DISTANCE, ZGLSR, HOLIDAY, MEMO, AIR, EQT_CODE, FLIGHTNO,
        UP_CITY_CODE, DIS_CITY_CODE, HX_CODE, OD_CODE, FLY_TIME, Y_CABIN_P, NUMOFSOLD, CABINS, PRICEARR, FINAL_DEMAND,
        D0_KZL, DEMAND, D0_PRICEARR, DIFF_IST_HOUR, DETAIL_DIFF_BKD, BKD_SUM, HIS_1, HIS_2, HIS_3, HIS_4, HIS_5, HIS_6,
        HIS_7, YOY_DATE, YOY_BKD, YOY_REST, YOY_BKD_SUM, YOY_DETAIL_DIFF_BKD, YOY_NUMOFSOLD, YOY_PRICEARR, YOY_FINAL_DEMAND,
        YOY_DEMAND, YOY_KZL, YOY_D0_KZL, WOW_FLIGHT_NO, YOY_BKD_1, YOY_REST_1, YOY_DIFF_BKD_1, YOY_D0_KZL_1, YOY_KZL_1,
        YOY_BKD_2, YOY_REST_2, YOY_DIFF_BKD_2, YOY_D0_KZL_2, YOY_KZL_2, YOY_BKD_3, YOY_REST_3, YOY_DIFF_BKD_3, YOY_D0_KZL_3,
        YOY_KZL_3, DEP_LONGITUDE, DEP_LATITUDE, ARR_LONGITUDE, ARR_LATITUDE, FLY_SEASON, CANCEL_BKG, AFFIRM_BKG, CAPACITY_P,
        CAPACITY, OD_MARKET_PER, CAP_P, CAP_SUM, COM_MARKET_PER, CAP_C, CAP_COUNT, AREA_MARKET_PER, KZL_P, REST_P, KZL_HIS_1,
        KZL_HIS_2, KZL_HIS_3, KZL_HIS_4, KZL_HIS_5, KZL_HIS_6, KZL_HIS_7, DETAIL_DIFF_BKD_1, DETAIL_PRICE, DETAIL_BKD, LABEL,
        TOP_1, TOP_2, TOP_3, TOP_4, TOP_5, TOP_6, FEA_HR_CLASS, AIRCODE_CLASS, FEA_NEAREST_TIME_1, FEA_NEAREST_TIME_2,
        FEA_DELT_DEPTIME, TOP_MEAN, TOP_MAX, TOP_MIN, TOP_STD, FLIGHTS_SELF, FLIGHTS_TOTAL, POWER, FLIGHT_TYPE_CODE,
        SINGLE_LEG_TIME, AC_SINGLE_LEG_TIME, LAST_3_FLY_NUM, LAST_3_FLY_COUNT, LAST_3_FLY_RATE, LAST_2_FLY_NUM, LAST_2_FLY_COUNT,
        LAST_2_FLY_RATE, LAST_1_FLY_NUM, LAST_1_FLY_COUNT, LAST_1_FLY_RATE, FLY_NUM, FLY_COUNT, FLY_RATE, AFTER_1_FLY_NUM,
        AFTER_1_FLY_COUNT, AFTER_1_FLY_RATE, AFTER_2_FLY_NUM, AFTER_2_FLY_COUNT, AFTER_2_FLY_RATE, AFTER_3_FLY_NUM, AFTER_3_FLY_COUNT,
        AFTER_3_FLY_RATE, JF_TYPE, JF_FLIGHT_NO, JF_FEA_HR, JF_COM_MARKET_PER, JF_CAPACITY_P, JF_OD_MARKET_PER, JF_KZL, JF_FEA_FLIGHT_NO,
        JF_AIRCODE_CLASS, JF_PRICE, PRICE_GAP, JF_SINGLE_LEG_TIME, JF_AC_SINGLE_LEG_TIME, JF_DEP, JF_ARR, CREATE_TIME, CLSN, CLSN_MAX, CLSN_CAP, CLSN_BKD
    FROM t_2
) t