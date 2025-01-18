/*
Template Name: Tailwick - Admin & Dashboard Template
Author: Themesdesign
Website: https://themesdesign.in/
Contact: Themesdesign@gmail.com
File: listjs init js
*/

var checkAll = document.getElementById("checkAll");
if (checkAll) {
    checkAll.addEventListener("click", function () {
        var checkboxes = document.querySelectorAll('.form-check-all input[type="checkbox"]');
        Array.from(checkboxes).forEach(function (checkbox) {
            checkbox.checked = checkAll.checked;
            if (checkbox.checked) {
                checkbox.closest("tr").classList.add("table-active");
            } else {
                checkbox.closest("tr").classList.remove("table-active");
            }
        });
    });
}

var perPage = 5;
var editlist = false;

//Table
var options = {
    valueNames: [
		"checkBox",
        "docNo",
        "docTitle",
        "docWriterName",
        "docType",
        "approvalStatus",
        "initApproversName",
        "updateDatetime",
    ],
    page: perPage,
    pagination: true,
    plugins: [
        ListPagination({
            left: 2,
            right: 2
        })
    ]
};


// Init list
if (document.getElementById("documentList")) 
	console.log('초기화');
    var documentList = new List("documentList", options).on("updated", function (list) {
        // noresult show or hidden
        if (document.getElementsByClassName("noresult") && document.getElementsByClassName("noresult")[0]) {
            list.matchingItems.length == 0 ?
                (document.getElementsByClassName("noresult")[0].style.display = "block") :
                (document.getElementsByClassName("noresult")[0].style.display = "none");

            if (list.matchingItems.length > 0) {
                document.getElementsByClassName("noresult")[0].style.display = "none";
            } else {
                document.getElementsByClassName("noresult")[0].style.display = "block";
            }
        }

        // length get of list
        var isFirst = list.i == 1;
        var isLast = list.i > list.matchingItems.length - list.page;

        // make the Prev and Nex buttons disabled on first and last pages accordingly
        document.querySelector(".pagination-prev.disabled") ?
            document.querySelector(".pagination-prev.disabled").classList.remove("disabled") : "";
        document.querySelector(".pagination-next.disabled") ?
            document.querySelector(".pagination-next.disabled").classList.remove("disabled") : "";
        // pagignation code
        if (isFirst) {
            document.querySelector(".pagination-prev").classList.add("disabled");
        }
        if (isLast) {
            document.querySelector(".pagination-next").classList.add("disabled");
        }
        // show total numbars of racords
        const totalEmploysElement = document.querySelector(".total-Employs");
        const totalRecordsElement = documentList.listContainer.querySelector(".total-records");
        const showingElement = documentList.listContainer.querySelector(".showing");

        if (totalEmploysElement) totalEmploysElement.innerHTML = documentList.items.length;
        if (totalRecordsElement) totalRecordsElement.innerHTML = documentList.items.length;

        if (showingElement) showingElement.innerHTML = documentList.visibleItems.length;
        document.querySelector(".pagination-next").addEventListener("click", function () {
            document.querySelector(".pagination.listjs-pagination") ?
                document.querySelector(".pagination.listjs-pagination").querySelector(".active") && document.querySelector(".pagination.listjs-pagination").querySelector(".active").nextElementSibling != null ?
                    document.querySelector(".pagination.listjs-pagination").querySelector(".active").nextElementSibling.children[0].click() : "" : "";
        });

        document.querySelector(".pagination-prev").addEventListener("click", function () {
            document.querySelector(".pagination.listjs-pagination") ?
                document.querySelector(".pagination.listjs-pagination").querySelector(".active") && document.querySelector(".pagination.listjs-pagination").querySelector(".active").previousSibling != null ?
                    document.querySelector(".pagination.listjs-pagination").querySelector(".active").previousSibling.children[0].click() : "" : "";
        });
        refreshCallbacks();
    });
	

const xhttp = new XMLHttpRequest();
xhttp.onload = function () {
    var json_records = JSON.parse(this.responseText);
	// JSON 내용을 로그에 찍기
    console.log(json_records);
    Array.from(json_records).forEach(raw => {
        documentList.add({
			checkBox: `<input class="border rounded-sm appearance-none cursor-pointer size-4 bg-slate-100 border-slate-200 dark:bg-zink-600 dark:border-zink-500 checked:bg-custom-500 checked:border-custom-500 dark:checked:bg-custom-500 dark:checked:border-custom-500 checked:disabled:bg-custom-400 checked:disabled:border-custom-400" type="checkbox" name="chk_child">`,
            docNo: raw.docNo,
            docTitle: raw.docTitle,
            docWriterName: raw.docWriterName,
            docType: raw.docType,
            approvalStatus: raw.approvalStatus,
            initApproversName: raw.initApproversName,
            updateDatetime: raw.updateDatetime,
        });
        documentList.sort('updateDatetime', { order: "desc" });
        refreshCallbacks();
    });
    documentList.remove("docNo", '<a href="javascript:void(0);" class="fw-medium link-primary docNo">#VZ2101</a>');
}
xhttp.open("GET", "/pettopia/getDocumentList");
xhttp.send();

isCount = new DOMParser().parseFromString(
    documentList.items.slice(-1)[0]._values.doc_no,
    "text/html"
);

var isValue = isCount.body.firstElementChild.innerHTML;

var docNoField = document.getElementById("docNo-field"),
    docTitleField = document.getElementById("docTitle-field"),
    docWriterNameField = document.getElementById("docWriterName-field"),
    docTypeField = document.getElementById("docType-field"),
    approvalStatusField = document.getElementById("approvalStatus-field"),
    initApproversNameField = document.getElementById("initApproversName-field"),
    updateDatetimeField = document.getElementById("updateDatetime-field");

refreshCallbacks();

//filterContact("All");

function filterContact(isValue) {
    var values_status = isValue;
    documentList.filter(function (data) {
        var statusFilter = false;
        matchData = new DOMParser().parseFromString(
            data.values().status,
            "text/html"
        );
        var status = matchData.body.firstElementChild.innerHTML;
        if (status == "All" || values_status == "All") {
            statusFilter = true;
        } else {
            statusFilter = status == values_status;
        }
        return statusFilter;
    });

    documentList.update();
}

function updateList() {
    var values_status = document.querySelector("input[name=status]:checked").value;
    data = userList.filter(function (item) {
        var statusFilter = false;

        if (values_status == "All") {
            statusFilter = true;
        } else {
            statusFilter = item.values().sts == values_status;
        }
        return statusFilter;
    });
    userList.update();
}


document.querySelector("#documentList").addEventListener("click", function () {
    ischeckboxcheck();
});

var table = document.getElementById("documentTable");
// save all tr
var tr = table.getElementsByTagName("tr");
var trlist = table.querySelectorAll(".list tr");

var count = 16;

// Fetch all the forms we want to apply custom Bootstrap validation styles to
var forms = document.querySelectorAll('.tablelist-form')


var statusVal = new Choices(statusField);

function isStatus(val) {
    switch (val) {
        case "Active":
            return (
                '<span class="px-2.5 py-0.5 inline-block text-xs font-medium rounded border bg-green-100 border-transparent text-green-500 dark:bg-green-500/20 dark:border-transparent">' +
                val +
                "</span>"
            );
        case "Block":
            return (
                '<span class="px-2.5 py-0.5 inline-block text-xs font-medium rounded border bg-red-100 border-transparent text-red-500 dark:bg-red-500/20 dark:border-transparent">' +
                val +
                "</span>"
            );
    }
}

function ischeckboxcheck() {
    Array.from(document.getElementsByName("checkAll")).forEach(function (x) {
        x.addEventListener("click", function (e) {
            if (e.target.checked) {
                e.target.closest("tr").classList.add("table-active");
            } else {
                e.target.closest("tr").classList.remove("table-active");
            }
        });
    });
}

function refreshCallbacks() {
    var removeBtns = document.getElementsByClassName("remove-item-btn");
    if (removeBtns)
        Array.from(removeBtns).forEach(function (btn) {
            btn.addEventListener("click", function (e) {
                e.target.closest("tr").children[1].innerText;
                itemId = e.target.closest("tr").children[1].innerText;
                var itemValues = documentList.get({
                    id: itemId,
                });

                Array.from(itemValues).forEach(function (x) {
                    deleteid = new DOMParser().parseFromString(x._values.id, "text/html");
                    var isElem = deleteid.body.firstElementChild;
                    var isdeleteid = deleteid.body.firstElementChild.innerHTML;
                    if (isdeleteid == itemId) {
                        document.getElementById("delete-record").addEventListener("click", function () {
                            documentList.remove("id", isElem.outerHTML);
                        });
                    }
                });
            });
        });
}

function clearFields() {
    docNoField.value = "";
    docTitleField.value = "";
    docWriterNameField.value = "";
    docTypeField.value = "";
    approvalStatusField.value = "";
    initApproversNameField.value = "";
    updateDatetimeField.value = "";
}

function deleteMultiple() {
    var ids_array = [];
    var items = document.getElementsByName('chk_child');
    Array.from(items).forEach(function (ele) {
        if (ele.checked == true) {
            var trNode = ele.parentNode.parentNode;
            var id = trNode.querySelector('.docNo a').innerHTML;
            ids_array.push(id);
        }
    });
    
    if (ids_array.length > 0) {
        if (confirm('Are you sure you want to delete this?')) {
            ids_array.forEach(function (id) {
                // Assuming documentList.remove is a valid method to remove a single record
                documentList.remove("id", `<a href="javascript:void(0);" class="fw-medium link-primary docNo">${docNo}</a>`);
            });
            document.getElementById('checkAll').checked = false;
        } else {
            return false;
        }
    } else {
        Swal.fire({
            title: 'Please select at least one checkbox',
            customClass: {
                confirmButton: 'text-white btn bg-sky-500 border-sky-500 hover:text-white hover:bg-sky-600 hover:border-sky-600 focus:text-white focus:bg-sky-600 focus:border-sky-600 focus:ring focus:ring-sky-100 active:text-white active:bg-sky-600 active:border-sky-600 active:ring active:ring-sky-100 dark:ring-sky-400/20',
            },
            buttonsStyling: false,
            showCloseButton: true
        });
    }
}