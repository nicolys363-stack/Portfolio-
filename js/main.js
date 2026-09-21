/**
 * PORTFÓLIO PROFISSIONAL — NICOLY SILVA DE BARROS
 * JavaScript para interatividade, navegação suave e animações
 */

document.addEventListener('DOMContentLoaded', () => {
  // --- ELEMENT REFERENCES ---
  const header = document.querySelector('.site-header');
  const hamburgerBtn = document.querySelector('.hamburger-btn');
  const navMenu = document.querySelector('.nav-menu');
  const navLinks = document.querySelectorAll('.nav-link');
  const sections = document.querySelectorAll('section[id]');
  const copyEmailBtn = document.getElementById('copyEmailBtn');
  const currentYearSpan = document.getElementById('currentYear');

  // --- SET DYNAMIC YEAR ---
  if (currentYearSpan) {
    currentYearSpan.textContent = new Date().getFullYear();
  }

  // --- MOBILE MENU TOGGLE ---
  if (hamburgerBtn && navMenu) {
    hamburgerBtn.addEventListener('click', () => {
      const isOpen = navMenu.classList.toggle('open');
      hamburgerBtn.classList.toggle('open');
      hamburgerBtn.setAttribute('aria-expanded', isOpen);
      document.body.style.overflow = isOpen ? 'hidden' : '';
    });

    // Close menu when clicking on any nav link
    navLinks.forEach(link => {
      link.addEventListener('click', () => {
        navMenu.classList.remove('open');
        hamburgerBtn.classList.remove('open');
        hamburgerBtn.setAttribute('aria-expanded', 'false');
        document.body.style.overflow = '';
      });
    });
  }

  // --- STICKY HEADER EFFECT ON SCROLL ---
  const handleHeaderScroll = () => {
    if (window.scrollY > 40) {
      header.classList.add('scrolled');
    } else {
      header.classList.remove('scrolled');
    }
  };
  window.addEventListener('scroll', handleHeaderScroll, { passive: true });
  handleHeaderScroll();

  // --- ACTIVE NAV LINK HIGHLIGHT (SCROLL SPY) ---
  const handleScrollSpy = () => {
    const scrollPosition = window.scrollY + 150;

    sections.forEach(section => {
      const sectionTop = section.offsetTop;
      const sectionHeight = section.offsetHeight;
      const sectionId = section.getAttribute('id');

      if (scrollPosition >= sectionTop && scrollPosition < sectionTop + sectionHeight) {
        navLinks.forEach(link => {
          link.classList.remove('active');
          if (link.getAttribute('href') === `#${sectionId}`) {
            link.classList.add('active');
          }
        });
      }
    });
  };
  window.addEventListener('scroll', handleScrollSpy, { passive: true });

  // --- INTERSECTION OBSERVER FOR FADE-IN ANIMATIONS ---
  const observerOptions = {
    root: null,
    rootMargin: '0px',
    threshold: 0.12
  };

  const fadeObserver = new IntersectionObserver((entries, observer) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('is-visible');
        observer.unobserve(entry.target);
      }
    });
  }, observerOptions);

  const animatedElements = document.querySelectorAll('.fade-in-section');
  animatedElements.forEach(el => fadeObserver.observe(el));

  // --- COPY EMAIL TO CLIPBOARD WITH FEEDBACK ---
  if (copyEmailBtn) {
    copyEmailBtn.addEventListener('click', async (e) => {
      e.preventDefault();
      const email = 'nicolys363@gmail.com';

      try {
        if (navigator.clipboard && window.isSecureContext) {
          await navigator.clipboard.writeText(email);
        } else {
          // Fallback for older browsers / non-https local contexts
          const textArea = document.createElement('textarea');
          textArea.value = email;
          textArea.style.position = 'fixed';
          textArea.style.left = '-999999px';
          textArea.style.top = '-999999px';
          document.body.appendChild(textArea);
          textArea.focus();
          textArea.select();
          document.execCommand('copy');
          textArea.remove();
        }

        const originalText = copyEmailBtn.innerHTML;
        copyEmailBtn.innerHTML = `
          <svg style="width:14px;height:14px;fill:none;stroke:#10B981;stroke-width:2" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
          </svg>
          <span style="color:#34D399;font-weight:600">E-mail Copiado!</span>
        `;

        setTimeout(() => {
          copyEmailBtn.innerHTML = originalText;
        }, 2200);
      } catch (err) {
        console.error('Erro ao copiar e-mail:', err);
      }
    });
  }
});
