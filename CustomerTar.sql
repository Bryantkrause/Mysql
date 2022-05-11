SELECT CustomerName,
    FacilityName,
    TariffName,
    Rate,
    SplitMonthRate,
    MinimumCharge
FROM CustomerTariff
'M'
SELECT 
    CustomerTariff.CustomerName,
    CustomerTariff.FacilityName,
    Tariff.TariffAlias AS Charge,
    CustomerTariff.Rate,
    CustomerTariff.SplitMonthRate,
    CustomerTariff.MinimumCharge
FROM CustomerTariff LEFT JOIN Tariff ON CustomerTariff.TariffName=Tariff.TariffName