document.addEventListener("turbo:load", function() {
  const flashMessages = document.querySelectorAll(".flash");
  console.log(flashMessages);
  flashMessages.forEach(flashMessage => {
    setTimeout(() => {
      flashMessage.classList.add("hidden");
    }, 2500);
  });
});