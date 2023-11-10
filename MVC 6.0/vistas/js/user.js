modalAddUserClose = document.querySelector(".close-modal-add-user");
modalAddUserCancel = document.querySelector(".cancel-modal-add-user");
modalAddUser = document.querySelector(".modal-frame.modal-add-user");
modalAddUserOpen = document.querySelector(".add-new-user");

modalEditUserClose = document.querySelector(".close-modal-edit-user");
modalEditUserCancel = document.querySelector(".cancel-modal-edit-user");
modalEditUser = document.querySelector(".modal-frame.modal-edit-user");
modalEditUserOpen = document.querySelectorAll(".edit-user");

modalPenalUserClose = document.querySelector(".close-modal-penal-user");
modalPenalUserCancel = document.querySelector(".cancel-modal-penal-user");
modalPenalUser = document.querySelector(".modal-frame.modal-penal-user");
modalPenalUserOpen = document.querySelectorAll(".penal-user");

modalDelUserClose = document.querySelector(".close-modal-del-user");
modalDelUserCancel = document.querySelector(".cancel-modal-del-user");
modalDelUser = document.querySelector(".modal-frame.modal-del-user");
modalDelUserOpen = document.querySelectorAll(".del-user");

modalEditUserClose.addEventListener("click", ()=>{
    modalEditUser.classList.remove('active');
});

modalEditUserCancel.addEventListener("click", ()=>{
    modalEditUser.classList.remove('active');
});


modalPenalUserClose.addEventListener("click", ()=>{
    modalPenalUser.classList.remove('active');
});

modalPenalUserCancel.addEventListener("click", ()=>{
    modalPenalUser.classList.remove('active');
});


modalDelUserClose.addEventListener("click", ()=>{
    modalDelUser.classList.remove('active');
});

modalDelUserCancel.addEventListener("click", ()=>{
    modalDelUser.classList.remove('active');
});


for (var i = 0; i < modalDelUserOpen.length; i++) {
    
    modalEditUserOpen[i].addEventListener("click",()=>{
        modalEditUser.classList.add('active');
    });
    
    
    modalPenalUserOpen[i].addEventListener("click",()=>{
        modalPenalUser.classList.add('active');
    });
    
    
    modalDelUserOpen[i].addEventListener("click",()=>{
        modalDelUser.classList.add('active');
    });
    
}


modalAddUserClose.addEventListener("click", ()=>{
    modalAddUser.classList.remove('active');
});

modalAddUserCancel.addEventListener("click", ()=>{
    modalAddUser.classList.remove('active');
});

modalAddUserOpen.addEventListener("click",()=>{
    modalAddUser.classList.add('active');
});