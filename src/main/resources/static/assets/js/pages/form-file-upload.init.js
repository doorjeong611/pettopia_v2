/*
Template Name: Tailwick - Admin & Dashboard Template
Author: Themesdesign
Website: https://themesdesign.in/
Contact: Themesdesign@gmail.com
File: Form file upload Js File
*/
// Dropzone 초기화'
/*
var dropzonePreviewNode = document.querySelector("#dropzone-preview-list");
if (dropzonePreviewNode) {
    var previewTemplate = dropzonePreviewNode.parentNode.innerHTML;
    dropzonePreviewNode.parentNode.removeChild(dropzonePreviewNode);

    var dropzone = new Dropzone("#formAddRoom", { // 폼의 ID를 사용하여 Dropzone 초기화
        url: "${pageContext.request.contextPath}/room/addRoom", // 파일을 전송할 URL
        method: "post",
        paramName: "roomImg", // 파일 파라미터 이름
        previewTemplate: previewTemplate,
        previewsContainer: "#dropzone-preview",
        maxFilesize: 2, // MB
        acceptedFiles: ".jpeg,.jpg,.png,.gif",
        addRemoveLinks: true,
        success: function(file, response) {
            console.log("Successfully uploaded:", response);
        },
        error: function(file, response) {
            console.error("Error uploading:", response);
        }
    });
}*/



// Dropzone
var dropzonePreviewNode = document.querySelector("#dropzone-preview-list");
dropzonePreviewNode.id = "";
if (dropzonePreviewNode) {
    var previewTemplate = dropzonePreviewNode.parentNode.innerHTML;
    dropzonePreviewNode.parentNode.removeChild(dropzonePreviewNode);
    var dropzone = new Dropzone(".dropzone", {
        url: 'https://httpbin.org/post',
        method: "post",
        previewTemplate: previewTemplate,
        previewsContainer: "#dropzone-preview",
    });
}

// Dropzone
var dropzonePreviewNode = document.querySelector("#dropzone-preview-list2");
dropzonePreviewNode.id = "";
if (dropzonePreviewNode) {
    var previewTemplate = dropzonePreviewNode.parentNode.innerHTML;
    dropzonePreviewNode.parentNode.removeChild(dropzonePreviewNode);
    var dropzone = new Dropzone(".dropzone2", {
        url: 'https://httpbin.org/post',
        method: "post",
        previewTemplate: previewTemplate,
        previewsContainer: "#dropzone-preview2",
    });
}