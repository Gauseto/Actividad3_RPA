;Header and description

(define (domain Actividad3_RPA_dominio)

;remove requirements that are not needed
(:requirements :strips :typing :conditional-effects :negative-preconditions)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle

    ambulancia localizacion paciente - object

)

(:predicates ;todo: define predicates here

    (pos_ambulancia ?ambulancia - ambulancia ?l_ambu - localizacion)
    (pos_paciente ?paciente - paciente ?l_pac - localizacion)
    (enlace ?l1 ?l2 - localizacion)
    (ocupado ?e - enfermo ?a - ambulancia)

)


(:action conducir_ambulancia 
    :parameters (?ambulancia - ambulancia ?l1 ?l2 - localizacion)
    :precondition (and 
        (pos_ambulancia ?ambulancia ?l1)
        (enlace ?l1 ?l2)
    )
    :effect (and 
        (not (pos_ambulancia ?ambulancia ?l1))
        (pos_ambulancia ?ambulancia ?l2)
    )
)

(:action subir_ambulancia 
    :parameters (?ambulancia - ambulancia ?paciente - paciente ?l - localizacion)
    :precondition (and
        (pos_paciente ?paciente ?l)
        (pos_ambulancia ?ambulancia ?l)
        (not (ocupado ?paciente ?ambulancia))
    )
    :effect (and 
        (not (pos_paciente ?paciente ?l))
        (ocupado ?paciente ?ambulancia)
    )
)

(:action bajar_ambulancia 
    :parameters (?ambulancia - ambulancia ?paciente - paciente ?l - localizacion)
    :precondition (and

        (pos_ambulancia ?ambulancia ?l)
         (ocupado ?paciente ?ambulancia)
    )
    :effect (and 
        (not (ocupado ?paciente ?ambulancia))
        (pos_paciente ?paciente ?l)
    )
)

)