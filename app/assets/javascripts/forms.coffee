$(document).on "ajax:beforeSend", "#emails-form", ()->
	console.log "Se esta enviando el formulario"
$(document).on "ajax:success", "#emails-form",(e, data,estado,xhr)->
	$("#email-info").html "Ya estas en la fila de las invitaciones beta"
	$(this).slideUp()
$(document).on "ajax:error", "#emails-form",(e, data,estado,xhr)->
	console.log data
	$("#email-info").html data.responseJSON.email[0]
