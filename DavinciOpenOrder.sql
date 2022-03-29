
SELECT 
public.dv_order.actual_trans_ts, public.dv_order.doc_number, public.dv_order.po_number, public.dv_order.type, public.dv_order.status, 
dv_business_partner.description 
FROM public.dv_order INNER JOIN public.dv_business_partner ON public.dv_order.vendor_id = public.dv_business_partner.id
WHERE public.dv_order.doc_number NOT LIKE '%ADJ%' AND NOT (public.dv_order.status=6 OR public.dv_order.status=9 ) AND
 (public.dv_order.actual_trans_ts >='2022-03-01 00:00:00' AND public.dv_order.actual_trans_ts< '2022-04-01 00:00:00')
 ORDER BY public.dv_order.type, public.dv_business_partner.description


