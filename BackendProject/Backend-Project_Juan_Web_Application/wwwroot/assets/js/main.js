$(document).on("click", ".modal-btn", function (e) {
    e.preventDefault();
    let url = $(this).attr("href");

    fetch(url).then(response=>response.text())
        .then(data => {
            $("#quick_view .modal-dialog").html(data)
        })
    $("#quick_view").modal("show")
} )