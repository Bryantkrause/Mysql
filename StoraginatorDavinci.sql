SELECT
dv_business_partner.accountid, dv_inventory.recv_ts,dv_inventory.ship_ts , dv_inventory.containerid , dv_item.item_code, dv_item.description
FROM 
dv_inventory INNER JOIN dv_item ON dv_inventory.item_id=dv_item.id INNER JOIN dv_business_partner ON dv_item.vendor_id=dv_business_partner.id
INNER JOIN dv_storage ON dv_inventory.storage_id=dv_storage.id
WHERE
dv_business_partner.enabled=1 AND
dv_business_partner.accountid='10' 
ORDER BY dv_business_partner.accountid, dv_inventory.recv_ts

let
    Source = Odbc.Query("dsn=DAVINCIDB", "SELECT ST.description LocationName, BP.description CustomerName, 
    ST.Zone,#(lf)Count(distinct(INV.containerid)) PalletCount#(lf)#(lf)
    FROM dv_inventory INV INNER JOIN dv_item IT ON INV.item_id=IT.id #(lf)#(tab)INNER JOIN dv_business_partner BP ON IT.vendor_id=BP.id#(lf)#(tab)
    INNER JOIN dv_storage ST ON INV.storage_id=ST.id#(lf)#(lf)
    WHERE INV.warehouse_id=3 and BP.enabled=1 and INV.qty_shipped=0  and (INV.qty_available+INV.qty_allocated+INV.qty_hold+INV.qty_damaged)>0#(lf)and ST.description<>'' 
    and not(BP.accountid in ('000', 'TEST', 'BT', '36','262', 'GRAN1103'))#(lf)#(lf)#(lf)
    GROUP BY ST.description, BP.description, ST.Zone"),
    #"Filtered Rows" = Table.SelectRows(Source, each true),
    #"Appended Query" = Table.Combine({#"Filtered Rows", #"DV Downey In Fullerton"})
in
    #"Appended Query"
dv_inventory.qty_shipped IS NULL
AND
(dv_inventory.qty_allocated + dv_inventory.qty_hold+dv_inventory.qty_damaged>0) 