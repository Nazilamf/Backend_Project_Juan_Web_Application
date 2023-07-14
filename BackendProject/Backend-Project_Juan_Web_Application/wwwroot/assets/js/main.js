$(document).on("click", ".modal-btn", function (e) {
    e.preventDefault();
    let url = $(this).attr("href");

    fetch(url).then(response=>response.text())
        .then(data => {
            $("#quick_view .modal-dialog").html(data)
        })
    $("#quick_view").modal("show")
})

$(document).on("click", ".basket-btn", function (e) {
    e.preventDefault();
    let url = $(this).attr("href");

    fetch(url).then(response => {

        if (!response.ok) {
            alert("Xeta bas verdi")
        }
        else 
            return response.text()
        
    }).then(data => {
        $("#basketcard").html(data);
    }).then(() => {
        var value = $(".minicart-inner-content").attr("data-count");
        $(".notification").html(value);
    })

    
})