function CarregarMascara () {

    // Checa se o datepicker de data de nascimento existe
    if( $('#id_data_nasc').length){

        $.datepicker._generateMonthYearHeader_original = $.datepicker._generateMonthYearHeader;

        $.datepicker._generateMonthYearHeader = function(inst, dm, dy, mnd, mxd, s, mn, mns) {
            var header = $($.datepicker._generateMonthYearHeader_original(inst, dm, dy, mnd, mxd, s, mn, mns)),
                years = header.find('.ui-datepicker-year');

            // Código para mostrar os anos na ordem inversa
            years.html(Array.prototype.reverse.apply(years.children()));

            // Retorna para o html os anos
            return $('<div />').append(header).html();
        };
    }

    var data = new Date;

    $('.data').mask("00/00/0000", {placeholder: "__/__/____"});

    $('#id_data_nasc').datepicker({
        changeMonth: true,
        changeYear: true,
        defaultDate: "-10y",
        yearRange: (data.getFullYear()-100).toString() + ':' + (data.getFullYear()-10).toString(),
        dateFormat:'dd/mm/yy',
        monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
        monthNamesShort: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
        dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
        dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
        dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
        beforeShowDay: function(date) {
            return [date < data, ""];
        }

    });

    $('#id_cpf').mask("000.000.000-00", {placeholder:"___.___.___-__"});
}

$(document).ready(function (){

    CarregarMascara();
});