function copyTable() {
    const table = document.getElementById("dataTable");
    let text = "";
    for (let row of table.rows) {
        let rowText = Array.from(row.cells).map(cell => cell.innerText.trim()).join("\t");
        text += rowText + "\n";
    }

    navigator.clipboard.writeText(text).then(() => {
        alert("Tabla copiada al portapapeles.");
    }).catch(err => {
        console.error("Error al copiar:", err);
        alert("Error al copiar la tabla.");
    });
}

function downloadCSV() {
    const table = document.getElementById("dataTable");
    let csv = "";
    for (let row of table.rows) {
        let rowText = Array.from(row.cells).map(cell => {
            let cellText = cell.innerText.trim();
            return `"${cellText.replace(/"/g, '""')}"`;
        }).join(",");
        csv += rowText + "\n";
    }

    const blob = new Blob([csv], { type: "text/csv" });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url;
    a.download = "tabla.csv";
    a.click();
    URL.revokeObjectURL(url);
}

function printTable() {
    const printContent = document.getElementById("dataTable").outerHTML;
    const printWindow = window.open("", "", "height=600,width=800");
    printWindow.document.write(`
        <html>
        <head>
            <title>Imprimir Tabla</title>
            <style>
                table { width: 100%; border-collapse: collapse; }
                th, td { border: 1px solid #000; padding: 8px; text-align: left; }
                th { background-color: #f2f2f2; }
            </style>
        </head>
        <body>${printContent}</body>
        </html>
    `);
    printWindow.document.close();
    printWindow.focus();
    printWindow.print();
    printWindow.close();
}
