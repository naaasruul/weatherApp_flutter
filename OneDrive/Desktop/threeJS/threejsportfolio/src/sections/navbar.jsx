import React, { useState } from "react";

const Navbar = () => {
  const [isOpen, setIsOpen] = useState(false);
  const NavItems = () => {
    return (
      <ul className="nav-ul">
        <a
          href="#about"
          className="text-neutral-400 hover:text-white transition-colors px-5 py-3"
        >
          About
        </a>
        <a
          href="#projects"
          className="text-neutral-400 hover:text-white transition-colors px-5 py-3"
        >
          Projects
        </a>
        <a
          href="#contact"
          className="text-neutral-400 hover:text-white transition-colors px-5 py-3"
        >
          Contact
        </a>
      </ul>
    )
  }
  return (
    <header className="text-white fixed top-0 left-0 w-full h-16 bg-black/90">
      <div className="max-w-7xl mx-auto">
        <div className="flex justify-between items-center py-5 mx-auto c-space">
          <a
            href="/"
            className="text-neutral-400 font-bold text-xl hover:text-white transition-colors"
          >
            Nasrulhaq
          </a>

          <button className="text-neutral-400 hover:text-white focus:outline-none sm:hidden flex" onClick={() => setIsOpen(!isOpen)}>
            <img
              src={isOpen ? "assets/close.svg" : "assets/menu.svg"}
              alt=""
              className="w-6 h-6"
            />
          </button>

          <nav className="sm:flex">
            <NavItems />
          </nav>
        </div>
      </div>
    </header>
  );
};

export default Navbar;
