// Matrix Rain Animation - Force Canvas Version
// This script FORCES a canvas to exist and maintain itself

console.log('[Matrix Rain] Script loaded');

(function() {
  'use strict';
  
  const CANVAS_ID = 'matrix-rain-canvas';
  let canvas, ctx;
  let columns = 0;
  let drops = [];
  const fontSize = 14;
  const chars = 'アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲン0123456789';
  const charArray = chars.split('');
  let animating = false;
  
  function createCanvas() {
    console.log('[Matrix Rain] Creating canvas...');
    
    // Remove any existing canvas
    const existing = document.getElementById(CANVAS_ID);
    if (existing) {
      existing.remove();
    }
    
    // Create new canvas
    canvas = document.createElement('canvas');
    canvas.id = CANVAS_ID;
    
    // Apply styles directly via JavaScript (bypasses CSS issues)
    canvas.style.cssText = `
      position: fixed !important;
      top: 0 !important;
      left: 0 !important;
      width: 100vw !important;
      height: 100vh !important;
      z-index: -1 !important;
      pointer-events: none !important;
      display: block !important;
      background-color: transparent !important;
    `;
    
    // Insert at the very beginning of body
    if (document.body.firstChild) {
      document.body.insertBefore(canvas, document.body.firstChild);
    } else {
      document.body.appendChild(canvas);
    }
    
    ctx = canvas.getContext('2d');
    
    console.log('[Matrix Rain] Canvas created:', canvas);
    return canvas;
  }
  
  function resize() {
    if (!canvas || !ctx) return;
    
    const w = window.innerWidth;
    const h = window.innerHeight;
    
    canvas.width = w;
    canvas.height = h;
    
    columns = Math.floor(w / fontSize);
    drops = [];
    for (let i = 0; i < columns; i++) {
      drops[i] = Math.random() * -100;
    }
    
    console.log('[Matrix Rain] Resized:', w, 'x', h, 'columns:', columns);
  }
  
  function draw() {
    if (!ctx || !canvas) return;
    
    // Semi-transparent background for trail effect
    ctx.fillStyle = 'rgba(13, 17, 23, 0.05)';
    ctx.fillRect(0, 0, canvas.width, canvas.height);
    
    ctx.font = fontSize + 'px monospace';
    
    for (let i = 0; i < drops.length; i++) {
      const char = charArray[Math.floor(Math.random() * charArray.length)];
      const x = i * fontSize;
      const y = drops[i] * fontSize;
      
      // Color variation - mostly subtle, occasionally bright
      const rand = Math.random();
      if (rand > 0.995) {
        ctx.fillStyle = 'rgba(126, 231, 135, 0.8)'; // Bright green
      } else if (rand > 0.98) {
        ctx.fillStyle = 'rgba(88, 166, 255, 0.6)'; // Blue
      } else if (rand > 0.96) {
        ctx.fillStyle = 'rgba(86, 212, 221, 0.5)'; // Teal
      } else {
        ctx.fillStyle = 'rgba(88, 166, 255, 0.15)'; // Dim blue - main color
      }
      
      ctx.fillText(char, x, y);
      
      // Reset when off screen
      if (y > canvas.height && Math.random() > 0.975) {
        drops[i] = 0;
      }
      
      drops[i] += 0.5 + Math.random() * 0.3;
    }
  }
  
  function animate() {
    if (!animating) return;
    draw();
    requestAnimationFrame(animate);
  }
  
  function ensureCanvas() {
    const existing = document.getElementById(CANVAS_ID);
    if (!existing || !document.body.contains(existing)) {
      console.log('[Matrix Rain] Canvas missing, recreating...');
      createCanvas();
      resize();
    }
  }
  
  function start() {
    console.log('[Matrix Rain] Starting...');
    
    if (!document.body) {
      console.log('[Matrix Rain] No body yet, waiting...');
      return false;
    }
    
    createCanvas();
    resize();
    
    if (!animating) {
      animating = true;
      animate();
    }
    
    // Watch for resize
    window.addEventListener('resize', resize);
    
    // Periodically ensure canvas exists (handles hydration removal)
    setInterval(ensureCanvas, 500);
    
    console.log('[Matrix Rain] Started successfully!');
    return true;
  }
  
  // Try to start immediately
  if (document.body) {
    start();
  }
  
  // Also try on DOMContentLoaded
  document.addEventListener('DOMContentLoaded', function() {
    console.log('[Matrix Rain] DOMContentLoaded fired');
    start();
  });
  
  // And on load
  window.addEventListener('load', function() {
    console.log('[Matrix Rain] Window load fired');
    start();
  });
  
  // Multiple delayed attempts
  [0, 50, 100, 200, 500, 1000, 2000, 3000].forEach(function(delay) {
    setTimeout(function() {
      if (!animating) {
        console.log('[Matrix Rain] Delayed attempt at', delay, 'ms');
        start();
      }
    }, delay);
  });
})();
