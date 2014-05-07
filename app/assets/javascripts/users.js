// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function ()
{
    $('#user_date_of_birth').datepicker({
      dateFormat: "yy-mm-dd",
      changeMonth: true,
      changeYear: true,
      yearRange: '1900:2014',
      defaultDate: '1970-01-01'
    });
});