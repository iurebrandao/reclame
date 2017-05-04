var heatmap,map;
var pontos = [];
var brasilia = {lat: -15.7849048, lng: -47.9463546};
var lista_pontos;

function initMap() {
    $(document).ready(function () {
        map = new google.maps.Map(document.getElementById('map'), {
            center: brasilia,
            zoom: 10,
            mapTypeId: google.maps.MapTypeId.roadmap,
            scaleControl: true,
            draggable: true
        });

        heatmap = new google.maps.visualization.HeatmapLayer({
            data: pontos,
            map: map
        });
        getPontos();
    });
}

function getPontos() {
    for (var i = 0; i < lista_pontos.length; i++) {
        pontos[i] = new google.maps.LatLng(lista_pontos[i].lat, lista_pontos[i].lng);
    };
}