
const navSlide = () =>{ /* 버거 버튼 누르면 nav-link 활성화되도록 구현*/
    const burger = document.querySelector('.burger');
    const nav = document.querySelector('.nav-links');
    // individual links : 각 메뉴를 불러와야 되니까
    const navLinks= document.querySelectorAll('.nav-links li');

    
    burger.addEventListener('click', ()=>{
        // Toggle Nav
        nav.classList.toggle('nav-active');

        
        // Animate Links 
        /* 각 메뉴의 개수 index 만큼 꺼내와야 되니까 */
        navLinks.forEach((link, index) => {
            /* 약간씩 delay 주는 것 */
            if(link.style.animation){
                link.style.animation = ''
            } else {
                link.style.animation = `navLinkFade 0.5s ease forwards ${index / 7 + 0.5}s`;
            }
        });

        // Burger Animation 
        burger.classList.toggle('toggle');
    });

}

navSlide();

$('#search').click(function(){
    
    $('#searchForm').submit();
 });

// 카테고리
$("#btnCate").on("mouseover", function(){
    $(".category").slideToggle();
});