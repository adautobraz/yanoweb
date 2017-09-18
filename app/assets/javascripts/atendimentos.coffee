# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
    ready = ->

        $('#atendimento_medico_id').parent().hide()
        $('#atendimento_data').parent().hide()
        $('#atendimento_horario').parent().hide()
    
        medicos =$('#atendimento_medico_id').html()
        datas = $('#atendimento_data').html()
        horarios = $('#atendimento_horario').html()
     
        $('#inputSpecialty').change ->
            $('#atendimento_data').parent().hide()
            $('#atendimento_horario').parent().hide()
            especialidade = $('#inputSpecialty :selected').text()
            optionsMedico = $(medicos).filter("optgroup[label='#{especialidade}']").html()
            if optionsMedico
                $('#atendimento_medico_id').html(optionsMedico)
                $('#atendimento_medico_id').parent().show()
            else
                $('#atendimento_medico_id').empty()
                $('#atendimento_medico_id').parent().hide()
                
        
        $('#atendimento_medico_id').change ->
            $('#atendimento_horario').parent().hide()
            especialidade = $('#inputSpecialty :selected').text()
            medico = $('#atendimento_medico_id :selected').text()
            filtro = especialidade.concat(medico);
            optionsData = $(datas).filter("optgroup[label='#{filtro}']").html()
            if optionsData
                $('#atendimento_data').html(optionsData)
                $('#atendimento_data').parent().show()
            else
                $('#atendimento_data').empty()
                $('#atendimento_data').parent().hide()
    
        $('#atendimento_data').change ->
            especialidade = $('#inputSpecialty :selected').text()
            medico = $('#atendimento_medico_id :selected').text()
            data = $('#atendimento_data :selected').text()
            filtro = especialidade.concat(medico, data);
            optionsHorario = $(horarios).filter("optgroup[label='#{filtro}']").html()
            if optionsHorario
                $('#atendimento_horario').html(optionsHorario)
                $('#atendimento_horario').parent().show()
            else
                $('#atendimento_horario').empty()
                $('#atendimento_horario').parent().hide()
    
                
    $(document).ready(ready)
    $(document).on('page:load', ready)