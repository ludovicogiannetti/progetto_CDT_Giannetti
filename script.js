document.addEventListener("DOMContentLoaded", function() {

    document.querySelectorAll(".main-container").forEach(
        container => {const firstText = container.querySelector(".text-block");
        if (!firstText) {
            updateNavButtons(container.dataset.article, 1);
            return;
        }
        activateBlock(firstText, container);
    });

    const bibMap = {
    "head-bib_1": "z26",
    "head-bib_2": "z28"
};

Object.entries(bibMap).forEach(function([headId, blockId]) {
    const heading = document.getElementById(headId);
    const block = document.getElementById(blockId);
    if (heading && block) {
        const clone = heading.cloneNode(true);
        clone.style.display = "";
        block.insertBefore(clone, block.firstChild);
    }
});
function repositionBibliographyFootnote() {
    const footnoteContainer = document.getElementById('bib-note-z30');
    const targetParagraph = document.getElementById('z30');
    
    if (footnoteContainer && targetParagraph) {
        const footnote = footnoteContainer.firstElementChild;
        if (footnote) {
            const clone = footnote.cloneNode(true);
            clone.style.display = 'block';
            
            targetParagraph.parentNode.insertBefore(clone, targetParagraph.nextSibling);
        }
        footnoteContainer.remove();
    }
}

repositionBibliographyTitles();
repositionBibliographyFootnote();
    
    
    document.querySelectorAll(".zone").forEach(zone => {
    zone.addEventListener("mouseenter", function() {
    const container = this.closest(".main-container");
    const targetId = this.dataset.target;  
    
    const relatedZones = container.querySelectorAll('.zone[data-target="' + targetId + '"]');
    
    relatedZones.forEach(z => {
    z.classList.add("group-hover");
    });
    });
    
    zone.addEventListener("mouseleave", function() {
    const container = this.closest(".main-container");
    const targetId = this.dataset.target;
    
    const relatedZones = container.querySelectorAll('.zone[data-target="' + targetId + '"]');
    relatedZones.forEach(z => {
    z.classList.remove("group-hover");
    });
    });
    zone.addEventListener("click", function() {
    const container = this.closest(".main-container");
    const targetId = this.dataset.target;
    
    container.querySelectorAll(".zone").forEach(z => {
    z.classList.remove("selected");
    });
    
    const relatedZones = container.querySelectorAll('.zone[data-target="' + targetId + '"]');
    relatedZones.forEach(z => {
    z.classList.add("selected");
    });
    
    container.querySelectorAll(".text-block").forEach(block => {
    block.classList.remove("active");
    });
    
    function escapeSelector(id) {
    return id.replace(/\./g, '\\.');
    }

    const escapedId = escapeSelector(targetId);
    const targetBlock = container.querySelector("#" + escapedId);

    
    
    if (targetBlock) {
    targetBlock.classList.add("active");
    
    checkAndToggleSignature(container, targetBlock);
    
    const textContainer = targetBlock.closest(".text-container");
    if (textContainer) {
    container.querySelectorAll(".text-container").forEach(tc => {
    tc.classList.remove("active");
    });
    textContainer.classList.add("active");
    }
    
    setTimeout(() => {
    targetBlock.scrollIntoView({
    behavior: 'smooth',
    block: 'start',
    inline: 'nearest'
    });
    }, 100);
    }
    });
    });
    
    
    function showPage(articleNum, pageNum) {
    articleNum = String(articleNum);
    pageNum = Number(pageNum);

    const container = document.querySelector(`.main-container[data-article="${articleNum}"]`);
    if (!container) return;

    const totalPages = container.querySelectorAll('.image-container').length;
    if (pageNum < 1 || pageNum > totalPages) return;

    const textContainer = container.querySelector(`.text-container[data-page="${pageNum}"]`);
    if (!textContainer) return;

    const firstBlock = textContainer.querySelector('.text-block');
    if (firstBlock) {
        activateBlock(firstBlock, container);
    } else {
        
        container.querySelectorAll('.text-container').forEach(tc => tc.classList.remove('active'));
        textContainer.classList.add('active');
        container.querySelectorAll('.image-container').forEach(img => img.classList.remove('active'));
        const targetImage = container.querySelector(`.image-container[data-page="${pageNum}"]`);
        if (targetImage) targetImage.classList.add('active');
        updateNavButtons(articleNum, pageNum);
    }
}
    
    function changePage(articleNum, direction) {
    articleNum = String(articleNum);

    const container = document.querySelector(`.main-container[data-article="${articleNum}"]`);
    if (!container) return;

    const currentTextContainer = container.querySelector('.text-container.active');
    if (!currentTextContainer) return;

    const currentPageNum = Number(currentTextContainer.dataset.page);
    const totalPages = container.querySelectorAll('.text-container').length;

    let targetPageNum = direction === "next"
        ? currentPageNum + 1
        : currentPageNum - 1;

    if (targetPageNum < 1 || targetPageNum > totalPages) return;

    showPage(articleNum, targetPageNum);
}
    
    function updateNavButtons(articleNum, currentPageNum) {
    articleNum = String(articleNum);
    currentPageNum = Number(currentPageNum);

    const container = document.querySelector(`.main-container[data-article="${articleNum}"]`);
    if (!container) return;

    const prevButton = container.querySelector('.nav-prev');
    const nextButton = container.querySelector('.nav-next');
    
    const totalPages = container.querySelectorAll('.image-container').length;

    if (prevButton) prevButton.classList.remove('active');
    if (nextButton) nextButton.classList.remove('active');

    if (currentPageNum > 1 && prevButton) {
        prevButton.classList.add('active');
    }
    if (currentPageNum < totalPages && nextButton) {
        nextButton.classList.add('active');
    }
}
    document.querySelectorAll('.nav-prev').forEach(button => {
    button.addEventListener('click', function() {
    const articleNum = this.dataset.article;
    changePage(articleNum, 'prev');
    });
    });
    
    document.querySelectorAll('.nav-next').forEach(button => {
    button.addEventListener('click', function() {
    const articleNum = this.dataset.article;
    changePage(articleNum, 'next');
    });
    });
    
    
    
    function initBlockNavigation() {
    
    document.querySelectorAll('.nav-block-next').forEach(btn => {
    if (btn.dataset.listenerAttached === 'true') return;
    
    btn.addEventListener('click', function(e) {
    e.preventDefault();
    navigateToNextBlock(this);
    });
    
    btn.dataset.listenerAttached = 'true';
    });
    
    document.querySelectorAll('.nav-block-prev').forEach(btn => {
    if (btn.dataset.listenerAttached === 'true') return;
    
    btn.addEventListener('click', function(e) {
    e.preventDefault();
    navigateToPrevBlock(this);
    });
    
    btn.dataset.listenerAttached = 'true';
    });
    }
    
    
    function activateBlock(block, mainContainer) {
    mainContainer.querySelectorAll('.text-block').forEach(b => b.classList.remove('active'));
    block.classList.add('active');
    
    const zoneTarget = block.dataset.continuedFrom || block.id;
    mainContainer.querySelectorAll('.zone').forEach(z => z.classList.remove('selected'));
    mainContainer.querySelectorAll(`.zone[data-target="${zoneTarget}"]`).forEach(z => z.classList.add('selected'));

    const textContainer = block.closest('.text-container');
    if (textContainer) {
        mainContainer.querySelectorAll('.text-container').forEach(tc => tc.classList.remove('active'));
        textContainer.classList.add('active');

        const pageNum = textContainer.dataset.page;
        mainContainer.querySelectorAll('.image-container').forEach(img => img.classList.remove('active'));
        const targetImage = mainContainer.querySelector(`.image-container[data-page="${pageNum}"]`);
        if (targetImage) targetImage.classList.add('active');
        updateNavButtons(mainContainer.dataset.article, Number(pageNum));
    }

    checkAndToggleSignature(mainContainer, block);
}

function navigateToNextBlock(btn) {
    const container = btn.closest('.text-container');
    if (!container) return;

    const mainContainer = container.closest('.main-container');
    if (!mainContainer) return;
    
    const allBlocks = Array.from(mainContainer.querySelectorAll('.text-block'));
    if (!allBlocks.length) return;

    const currentBlock = mainContainer.querySelector('.text-block.active');
    const currentIndex = currentBlock ? allBlocks.indexOf(currentBlock) : -1;
    const nextIndex = currentIndex + 1;

    if (nextIndex < allBlocks.length) {
        activateBlock(allBlocks[nextIndex], mainContainer);
    } else {
        
        activateBlock(allBlocks[0], mainContainer);
    }
}

function navigateToPrevBlock(btn) {
    const container = btn.closest('.text-container');
    if (!container) return;

    const mainContainer = container.closest('.main-container');
    if (!mainContainer) return;

    const allBlocks = Array.from(mainContainer.querySelectorAll('.text-block'));
    if (!allBlocks.length) return;

    const currentBlock = mainContainer.querySelector('.text-block.active');
    const currentIndex = currentBlock ? allBlocks.indexOf(currentBlock) : allBlocks.length;
    const prevIndex = currentIndex - 1;

    if (prevIndex >= 0) {
        
        activateBlock(allBlocks[prevIndex], mainContainer);
    } else {
        
        activateBlock(allBlocks[allBlocks.length - 1], mainContainer);
    }
}



    initBlockNavigation();
    const categoryColors = new Map();
    
function clearHighlights() {
    const highlighted = document.querySelectorAll('[class*="highlight-"]');
    highlighted.forEach(el => {
        el.classList.forEach(cls => {
            if (cls.startsWith('highlight-')) el.classList.remove(cls);
        });
        el.style.backgroundColor = '';  
    });
}


function highlightFullCategory(category) {
    clearHighlights();
    let selector = '';
    switch(category) {
        case 'person':
            selector = '.person';
            break;
        case 'place':
            selector = '.place';
            break;
        case 'organization':
            selector = '.organization';
            break;
        case 'date':
            selector = '.date';
            break;
        case 'measure':
            selector = '.measure';
            break;
        case 'correction':
            selector = '.choice-area';
            break;
        case 'currency':
            selector = '.currency';
            break;
        case 'date':
            selector = '.date';
            break;
        case 'correction':
            selector = '.choice-area';
            break;
        default:
            
            selector = `.filterable[data-category="${category}"]`;
            break;
    }
    const elements = document.querySelectorAll(selector);
    elements.forEach(el => {
        
        el.classList.forEach(cls => {
            if (cls.startsWith('highlight-')) el.classList.remove(cls);
        });
        el.classList.add(`highlight-${category}`);
    });
}

const subfilterColors = new Map();
let currentMainFilter = null;

const colorPalette = [
    '#FF6B6B', '#4ECDC4', '#45B7D1', '#96CEB4', '#FFEAA7',
    '#DDA0DD', '#98D8C8', '#F7DC6F', '#BB8FCE', '#85C1E2',
    '#F8C471', '#A9DFBF', '#F1948A', '#D7BDE2', '#AED6F1',
    '#F9E79F', '#ABEBC6', '#F5B7B1', '#D2B4DE', '#A3E4D7'
];

let colorIndex = 0;
function getNextColor() {
    const color = colorPalette[colorIndex % colorPalette.length];
    colorIndex++;
    return color;
}

function resetColorIndex() {
    colorIndex = 0;
    subfilterColors.clear();
}

function showSubfilterBanner(mainFilter) {
    currentMainFilter = mainFilter;
    const banner = document.getElementById('subfilter-banner');
    const title = document.getElementById('subfilter-title');
    const buttonsContainer = document.getElementById('subfilter-buttons');
    
    if (!banner || !title || !buttonsContainer) return;
    
    let values = new Set();
    let valueType = 'subtype';
    
    switch(mainFilter) {
        case 'natural':
        case 'occupation':
        case 'activity':
        case 'fauna':
        case 'time':
        case 'food-drink':
        case 'currency':
        case 'discipline':
        case 'inquiry':
        case 'agriculture':
            
            document.querySelectorAll(`.filterable[data-category="${mainFilter}"]`).forEach(el => {
                const subtype = el.dataset.subtype;
                if (subtype && subtype !== '') values.add(subtype);
                else if (el.dataset.type) values.add(el.dataset.type);
            });
            valueType = 'subtype';
            break;
            
        case 'literary':
            
            document.querySelectorAll('.filterable[data-category="literary"]').forEach(el => {
                const subtype = el.dataset.subtype;
                const type = el.dataset.type;
                if (subtype && subtype !== '') values.add(subtype);
                else if (type && type !== '') values.add(type);
            });
            valueType = 'subtype';
            break;
            
        case 'wealth':
            
            document.querySelectorAll('.filterable[data-category="wealth"]').forEach(el => {
                if (el.dataset.type) values.add(el.dataset.type);
            });
            valueType = 'type';
            break;
            
        case 'number':
            document.querySelectorAll('.number').forEach(el => {
                if (el.dataset.type) values.add(el.dataset.type);
            });
            valueType = 'type';
            break;
            
        case 'dialogue':
            
            document.querySelectorAll('.dialogue').forEach(el => {
                if (el.dataset.type) values.add(el.dataset.type);
                else values.add('discorso diretto');
            });
            valueType = 'type';
            break;
            
        case 'person':
            
            document.querySelectorAll('.person').forEach(el => {
                const role = el.dataset.role;
                if (role) values.add(role);
            });
            valueType = 'role';
            break;
            
        case 'place':

            document.querySelectorAll('.place').forEach(el => {
                if (el.dataset.type) values.add(el.dataset.type);
            });
            valueType = 'type';
            break;
            
        case 'organization':

            document.querySelectorAll('.organization').forEach(el => {
                if (el.dataset.type) values.add(el.dataset.type);
                else if (el.dataset.subtype) values.add(el.dataset.subtype);
            });
            valueType = 'type';
            break;

        case 'date':
            
            break;
        case 'correction':
            document.querySelectorAll('.choice-area.filterable').forEach(el => {
                const tipo = el.dataset.tipo;
                if (tipo && tipo !== '') values.add(tipo);
            });
            valueType = 'tipo';
            break;
            
        default:
            banner.style.display = 'none';
            return;
    }

    const excluded = [mainFilter];
    values.forEach(v => {
        if (excluded.includes(v)) values.delete(v);
    });
    
    
    if (values.size === 0) {
        banner.style.display = 'none';
        return;
    }
    
    
    const filterNames = {
        'natural': 'Elementi Naturali', 'occupation': 'Mestieri',
        'activity': 'Attività', 'organization': 'Organizzazioni',
        'literary': 'Letteratura', 'wealth': 'La Roba', 'fauna': 'Animali',
        'person': 'Persone', 'time': 'Tempo', 'food-drink': 'Cibo e Bevande',
        'currency': 'Valuta', 'discipline': 'Disciplina di studio',
        'inquiry': 'Inchiesta', 'number': 'Numeri', 'dialogue': 'Discorsi diretti',
        'place': 'Luoghi', 'agriculture': 'Agricoltura', 'date': 'Date',
        'correction': 'Correzioni', 'measure': 'Misure'
    };
    title.textContent = ` ${filterNames[mainFilter] || mainFilter} - clicca per evidenziare:`;
    
    buttonsContainer.innerHTML = '';
    resetColorIndex();

    const allBtn = document.createElement('button');
    allBtn.className = 'subfilter-item-btn all-items-btn';
    allBtn.textContent = 'Tutti';
    allBtn.style.backgroundColor = '#9b59b6';
    allBtn.style.border = 'none';
    allBtn.style.padding = '6px 12px';
    allBtn.style.margin = '4px';
    allBtn.style.borderRadius = '20px';
    allBtn.style.cursor = 'pointer';
    allBtn.style.fontFamily = 'Montserrat, sans-serif';
    allBtn.style.fontSize = '0.85em';
    allBtn.style.fontWeight = '500';
    allBtn.style.color = 'white';
    allBtn.addEventListener('click', (e) => {
    e.stopPropagation();
    highlightCategoryWithSubtypeColors(mainFilter);
    document.querySelectorAll('.subfilter-item-btn').forEach(b => b.classList.remove('active-subfilter'));
    allBtn.classList.add('active-subfilter');
});
buttonsContainer.appendChild(allBtn);
    
    const sortedValues = Array.from(values).sort();
    sortedValues.forEach(value => {
        const color = getNextColor();
        subfilterColors.set(value, color);
        
        const btn = document.createElement('button');
        btn.className = 'subfilter-item-btn';
        btn.textContent = value;
        btn.style.backgroundColor = color;
        btn.style.border = 'none';
        btn.style.padding = '6px 12px';
        btn.style.margin = '4px';
        btn.style.borderRadius = '20px';
        btn.style.cursor = 'pointer';
        btn.style.fontFamily = 'Montserrat, sans-serif';
        btn.style.fontSize = '0.85em';
        btn.style.fontWeight = '500';
        btn.style.color = '#081f37';
        btn.style.transition = 'all 0.2s';
        
        btn.addEventListener('click', (e) => {
    e.stopPropagation();
    clearHighlights();
    highlightBySubfilter(mainFilter, valueType, value, color);
    document.querySelectorAll('.subfilter-item-btn').forEach(b => b.classList.remove('active-subfilter'));
    btn.classList.add('active-subfilter');
});
        
        buttonsContainer.appendChild(btn);
    });

    allBtn.classList.add('active-subfilter');
    banner.style.display = 'block';
}

function highlightBySubfilter(mainFilter, valueType, value, color) {
    let selector = '';
    
    switch(mainFilter) {
        case 'natural':
        case 'occupation':
        case 'activity':
        case 'fauna':
        case 'time':
        case 'food-drink':
        case 'currency':
        case 'discipline':
        case 'inquiry':
        case 'agriculture':
        case 'literary':
        case 'wealth':
            selector = `.filterable[data-category="${mainFilter}"][data-${valueType}="${value}"]`;
            break;
        case 'number':
            selector = `.number[data-${valueType}="${value}"]`;
            break;
        case 'dialogue':
            selector = `.dialogue[data-${valueType}="${value}"]`;
            break;
        case 'person':
            selector = `.person[data-${valueType}="${value}"]`;
            break;
        case 'place':
            selector = `.place[data-${valueType}="${value}"]`;
            break;
        case 'organization':
            selector = `.organization[data-${valueType}="${value}"]`;
            break;
        case 'date':
            selector = `.date.filterable[data-${valueType}="${value}"]`;
            break;
        case 'correction':
            selector = `.choice-area.filterable[data-${valueType}="${value}"]`;
            break;    
        default:
            return;
    }
    
    const elements = document.querySelectorAll(selector);
    elements.forEach(el => {
        el.classList.forEach(cls => {
            if (cls.startsWith('highlight-')) el.classList.remove(cls);
        });
        el.classList.add(`highlight-${mainFilter}`);
        if (color) {
            el.style.backgroundColor = color;
        } else {
            el.style.backgroundColor = '';
        }
    });
}

function highlightCategoryWithSubtypeColors(mainFilter) {
    clearHighlights();
    let elements = [];
    
    switch(mainFilter) {
        case 'person':
            elements = document.querySelectorAll('.person');
            break;
        case 'place':
            elements = document.querySelectorAll('.place');
            break;
        case 'organization':
            elements = document.querySelectorAll('.organization');
            break;
        case 'date':
            elements = document.querySelectorAll('.date');
            break;
        case 'correction':
            elements = document.querySelectorAll('.choice-area');
            break;
        default:
            elements = document.querySelectorAll(`.filterable[data-category="${mainFilter}"]`);
            break;
    }

    elements.forEach(el => {
        
        let value = '';
        if (mainFilter === 'person') value = el.dataset.role;
        else if (mainFilter === 'place') value = el.dataset.type;
        else if (mainFilter === 'organization') value = el.dataset.type || el.dataset.subtype;
        else if (mainFilter === 'date') value = el.dataset.period || el.dataset.value;
        else if (mainFilter === 'correction') value = el.dataset.tipo;
        else value = el.dataset.subtype || el.dataset.type;

        if (value && subfilterColors.has(value)) {
            const color = subfilterColors.get(value);
            el.style.backgroundColor = color;
            el.classList.add(`highlight-${mainFilter}`);
        } else {
            
            el.style.backgroundColor = '#cccccc';
            el.classList.add(`highlight-${mainFilter}`);
        }
    });
}

function hideSubfilterBanner() {
    const banner = document.getElementById('subfilter-banner');
    if (banner) banner.style.display = 'none';
    currentMainFilter = null;
}

function initMainFilters() {
    document.querySelectorAll('.main-filter-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            const filter = this.dataset.filter;
            
            document.querySelectorAll('.main-filter-btn').forEach(b => b.classList.remove('active'));
            this.classList.add('active');
            
            if (filter === 'all') {
                hideSubfilterBanner();
                clearHighlights();
            } else {
                
                showSubfilterBanner(filter);
                
                highlightCategoryWithSubtypeColors(filter);   
            }
        });
    });
}

function initTooltips() {
    
    const filterable = document.querySelectorAll('.filterable:not(.person):not(.place):not(.organization)');
    filterable.forEach(el => {
        const info = el.dataset.info;
        if (info) {
            el.setAttribute('title', info);
        } else {
            
            const type = el.dataset.type;
            const subtype = el.dataset.subtype;
            let tooltip = '';
            if (subtype) tooltip = subtype;
            else if (type) tooltip = type;
            if (tooltip) el.setAttribute('title', tooltip);
        }
    });
}
    
    function checkAndToggleSignature(container, targetBlock) {
    const signature = container.querySelector('.signature');
    if (!signature) return;
    
    
    if (!targetBlock || !targetBlock.id) {
    signature.style.display = 'none';
    return;
    }
    
    const articleNum = container.dataset.article;
    const lastPageNum = container.querySelectorAll('.text-container').length;
    
    const lastTextContainer = container.querySelector(`.text-container[data-page="${lastPageNum}"]`);
    if (!lastTextContainer) {
    signature.style.display = 'none';
    return;
    }
    
    const lastPageBlocks = lastTextContainer.querySelectorAll('.text-block');
    if (lastPageBlocks.length === 0) {
    signature.style.display = 'none';
    return;
    }
    
    const lastBlock = lastPageBlocks[lastPageBlocks.length - 1];
    
    if (targetBlock.id === lastBlock.id) {
    signature.style.display = 'block';
    } else {
    signature.style.display = 'none';
    }
    }
    
    function repositionBibliographyTitles() {
    const title1 = document.getElementById('bib-head-1');
    const title2 = document.getElementById('bib-head-2');
    const para1 = document.getElementById('z26');
    const para2 = document.getElementById('z28');

    if (title1 && para1) {
        const clone1 = title1.cloneNode(true);
        clone1.style.display = 'block';      
        clone1.id = '';                      
        para1.parentNode.insertBefore(clone1, para1);
        title1.remove();                     
    }

    if (title2 && para2) {
        const clone2 = title2.cloneNode(true);
        clone2.style.display = 'block';
        clone2.id = '';
        para2.parentNode.insertBefore(clone2, para2);
        title2.remove();
    }
}

if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', repositionBibliographyTitles);
} else {
    repositionBibliographyTitles();
}

    initTooltips(); 
    initMainFilters();
    hideSubfilterBanner();
    });