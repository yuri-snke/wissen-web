$(document).ready(function(){
  $('#icon_inicio').mask('00/00/0000', {placeholder: "dd/mm/aaaa"});
  $('#icon_termino').mask('00/00/0000',{placeholder: "dd/mm/aaaa"});
  $('#icon_cpf').mask('000.000.000-00', {placeholder: "000.000.000-00"});
  $('#icon_hora_inicio').mask('00:00', {placeholder: "00:00"});
  $('#icon_hora_termino').mask('00:00', {placeholder: "00:00"});
  $('#icon_contato').mask('(00) 0000-0000', {placeholder: "(00) 0000-0000"});
  $('#in_celular').mask('(00) 00000-0000', {placeholder: "(00) 00000-0000"});
  $('#icon_zap').mask('(00) 00000-0000', {placeholder: "(00) 00000-0000"});
  $('#icon_cep').mask('00000-000', {placeholder: "00000-000"});
  $('#in_cep').mask('00000-000', {placeholder: "00000-000"});
  $('#icon_phone').mask('(00) 00000-0000', {placeholder: "(00) 00000-0000"});
  $('#icon_prec').mask('000.000.000.000.000,00', {reverse: true});
})
