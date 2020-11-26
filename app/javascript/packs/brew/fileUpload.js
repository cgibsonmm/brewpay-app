const fileUpload = document.getElementById("brew_logo");
const fileDisplay = document.getElementById("file-display");
const realInputField = document.getElementById("upload-btn");
const preview = document.getElementById("preview");

const acceptedFile = ["jpg", "png"];

fileDisplay.disabled = true;

const readURL = (file) => {
  return new Promise((res, rej) => {
    const reader = new FileReader();
    reader.onload = (e) => res(e.target.result);
    reader.onerror = (e) => rej(e);
    reader.readAsDataURL(file);
  });
};

const display = async (e) => {
  let file = e.target.files[0];
  const url = await readURL(file);
  preview.src = url;
};

fileUpload.addEventListener("change", (e) => {
  let file = fileUpload.value.split(".");
  let type = file[file.length - 1];
  if (acceptedFile.includes(type)) {
    display(e);
    fileDisplay.value = fileUpload.value.replace(/^.*[\\\/]/, "");
  } else {
    fileUpload.value = null;
  }
});

realInputField.addEventListener("click", () => {
  fileUpload.click();
});
