$().ready (() => {
    let astys = {};

    // haetaan asiakastyypit
    $.get({
        url: "http:/3000",
        success: (result) => {
            astys = result;
            result.forEach((r) => {
                let optstr = `<option value="${r.avain}">${r.lyhenne + " " + toTitleCase(r.selite)}</option>`;
                $('#custType').append(optstr);
                $('#custCustType').append(optstr);
            });
        }
    });

    // haetaan data
    fetch = () => {
        let sp = searcParameters();
        $.get({
            url: `https://3000/`,
            success: (result) => {
                showResultInTable(result, astys);
        }});
    }

    // bindataan click-event
    $('#searchBtn').click(() => {
        fetch();
    });

    // otetaan kaikki asiakaanlisäysformin elementit yhteen muuttujaan
    let allFields = $([])
        .add($('#custName'))
        .add($('#custAddress'))
        .add($('#custPostNbr'))
        .add($('#custPostOff'))
        .add($('#custCustType'));

  

// palauttaa hakuparametri-stringin jos kentät eivät ole tyhjiä
searcParameters = () => {
    let str = '';
    if ($('#name').val().trim() != '') {
        let name = $('#name').val().trim();
        str += `nimi=${name}`;
    }
    if ($('#address').val().trim() != '') {
        let address = $('#address').val().trim();
        if (str !== '') {
            str += '&';
        }
        str += `osoite=${address}`;
    }
    if ($('#custType').val() !== null) {
        let custType = $('#custType').val();
        if (str !== '') {
            str += '&';
        }
        str+=`asty_avain=${custType}`;
    }
    return str;
}

// tyhjentää data-tablen ja tuo haun tuloksen tableen
showResultInTable = (result, astys) => {
    $('#data tbody').empty();
    result.forEach(element => {
        let trstr = "<tr><td>" + element.nimi + "</td>\n";
        trstr += "<td>" + element.osoite + "</td>\n";
        trstr += "<td>" + element.postinro + "</td>\n";
        trstr += "<td>" + element.postitmp + "</td>\n";
        trstr += "<td>" + element.luontipvm + "</td>\n";
        astys.forEach(asty => {
            if (asty.avain === element.asty_avain) {
                trstr += "<td>" + toTitleCase(asty.selite) + "</td>";
            }
        });
        trstr += `<td><button onclick="deleteCustomer(${element.avain});" class="deleteBtn">Poista</button></td>`;
        trstr += "</tr>\n";
        $('#data tbody').append(trstr);
    });
}

