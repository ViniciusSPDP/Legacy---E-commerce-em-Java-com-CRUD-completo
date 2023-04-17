let photo = document.getElementById('img');
let file = document.getElementById('upload');
let photo2 = document.getElementById('img2');
let file2 = document.getElementById('upload2');
let photo3 = document.getElementById('img3');
let file3 = document.getElementById('upload3');


photo.addEventListener('click', () => {
    file.click();
});

file.addEventListener('change', (e) => {

    let reader = new FileReader();

    reader.onload = () => {
        photo.src = reader.result;
    };


    reader.readAsDataURL(file.files[0]);

});

photo2.addEventListener('click', () => {
    file2.click();
});

file2.addEventListener('change', (e) => {

    let reader = new FileReader();

    reader.onload = () => {
        photo2.src = reader.result;
    };


    reader.readAsDataURL(file2.files[0]);
});

photo3.addEventListener('click', () => {
    file3.click();
});

file3.addEventListener('change', (e) => {

    let reader = new FileReader();

    reader.onload = () => {
        photo3.src = reader.result;
    };


    reader.readAsDataURL(file3.files[0]);
});



