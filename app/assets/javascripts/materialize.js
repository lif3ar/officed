/* DATE PICKER - MATERIALIZE */
$(function() {
    $('.datepicker').pickadate({
        selectMonths: true,
        selectYears: 15
    });
});
/* SELECT - MATERIALIZE */
$(document).ready(function() {
    $('select').material_select();
});
/* MODAL - MATERIALIZE */
$(document).ready(function(){
    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    $('.modal-trigger').leanModal();
});

// Initialize collapse button
$(".button-collapse").sideNav();
// Initialize collapsible (uncomment the line below if you use the dropdown variation)
//$('.collapsible').collapsible();
$('.button-collapse').sideNav({
        menuWidth: 300, // Default is 240
        edge: 'right', // Choose the horizontal origin
        closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteor
    }
);
// Show sideNav
$('.button-collapse').sideNav('show');
// Hide sideNav
$('.button-collapse').sideNav('hide');