 SELECT PackDetail.UOM, PackDetail.Count, PackDetail.PackName
 FROM   RAMP_ENTERPRISE.dbo.PackDetail PackDetail
 WHERE  (PackDetail.UOM='CS' OR PackDetail.UOM='IN' OR PackDetail.UOM='PL') AND PackDetail.Count=0