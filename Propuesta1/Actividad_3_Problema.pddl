(define (problem Actividad3_RPA_dominio) (:domain Actividad3_RPA_dominio)
(:objects 

ambulancia1 - ambulancia
l1 l2 l3 l4 pos_ambulancia1 - localizacion
paciente1 paciente2 - paciente

)

(:init
    ;todo: put the initial state's facts and numeric values here
    (pos_ambulancia ambulancia1 l1)
    (pos_paciente paciente1 l4 )
    (pos_paciente paciente2 l3 )

    (enlace l1 l2)
    (enlace l2 l4)
    (enlace l4 l3)

    (enlace l2 l1)
    (enlace l4 l2)
    (enlace l3 l4)

)

(:goal (and
    
  (pos_paciente1 paciente1 l1)
 (pos_paciente2 paciente2 l1)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
