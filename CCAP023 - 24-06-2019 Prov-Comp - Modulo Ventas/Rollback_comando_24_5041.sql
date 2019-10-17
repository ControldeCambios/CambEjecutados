DELETE FITBANK.tcomandosmantenimiento 
where CSUBSISTEMA = 24
and CTRANSACCION = 4051
and COMANDO like '%com.fitbank.accounting.query.AutomaticAccountantVoucher%'
and ACTIVADO = 1
;