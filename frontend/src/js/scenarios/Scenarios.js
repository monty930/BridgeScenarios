import React, { useState, useEffect, useRef } from 'react';
import { useLocation } from 'react-router-dom';
import MakeScenarios from './MakeScenarios';
import GenerateExample from './GenerateExample';
import GenerateDealSet from './GenerateDealSet';
import UseScenarios from './UseScenarios';
import '../../css/Scenarios.css';
import UseScenariosChoose from "./UseScenariosChoose";

function Scenarios() {
    const [dealSettings, setDealSettings] = useState({
        NumberOfDeals: 1,
        Vul: 'None',
        Scoring: 'None',
        Flip: 'None',
        Dealer: 'None',
    });
    
    const location = useLocation();
    const pageLayoutRef = useRef(null);
    const [isDragging, setIsDragging] = useState(false);
    const [leftWidthRatio, setLeftWidthRatio] = useState(0.5);
    let dividerWidth = 8;
    console.log('dividerWidth:', dividerWidth);
    
    const minWidth = 400;

    useEffect(() => {
        function updatePanelWidths() {
            if (!pageLayoutRef.current) return;

            console.log('updatePanelWidths');

            const pageLayoutRect = pageLayoutRef.current.getBoundingClientRect();
            const totalWidth = pageLayoutRect.width;

            if (window.innerWidth <= 2 * minWidth + dividerWidth) {
                pageLayoutRef.current.style.gridTemplateColumns = `1fr ${dividerWidth}px 1fr`;
                return;
            }

            let leftWidth = totalWidth * leftWidthRatio - dividerWidth / 2;
            let rightWidth = totalWidth - leftWidth - dividerWidth / 2;

            if (leftWidth < minWidth) {
                leftWidth = minWidth;
                rightWidth = totalWidth - leftWidth - dividerWidth / 2;
            } else if (rightWidth < minWidth) {
                rightWidth = minWidth;
                leftWidth = totalWidth - rightWidth - dividerWidth / 2;
            }

            console.log('leftWidth:', leftWidth);

            pageLayoutRef.current.style.gridTemplateColumns = `${leftWidth}px ${dividerWidth}px ${rightWidth}px`;
        }

        function handleMouseMove(e) {
            if (!isDragging || window.innerWidth <= 800) return;

            console.log('handleMouseMove');

            const pageLayoutRect = pageLayoutRef.current.getBoundingClientRect();
            let newLeftWidth = e.clientX - pageLayoutRect.left - dividerWidth / 2;
            let newRightWidth = pageLayoutRect.width - newLeftWidth - dividerWidth;

            const totalWidth = pageLayoutRect.width;
            let newLeftWidthRatio = newLeftWidth / totalWidth;

            if (newLeftWidth >= minWidth && newRightWidth >= minWidth) {
                setLeftWidthRatio(newLeftWidthRatio);
            }
        }

        function handleMouseUp() {
            setIsDragging(false);
        }

        document.addEventListener('mousemove', handleMouseMove);
        document.addEventListener('mouseup', handleMouseUp);
        window.addEventListener('resize', updatePanelWidths);

        updatePanelWidths();

        return () => {
            document.removeEventListener('mousemove', handleMouseMove);
            document.removeEventListener('mouseup', handleMouseUp);
            window.removeEventListener('resize', updatePanelWidths);
        };
    }, [isDragging, leftWidthRatio]);

    let content;
    if (location.pathname === "/scenarios/make") {
        content = (
            <div className="ScenariosPage">
                <div className="MakeScenariosOuter"><MakeScenarios /></div>
                <div className="Divider" onMouseDown={() => setIsDragging(true)}></div>
                <div className="GenerateExampleOuter"><GenerateExample /></div>
            </div>
        );
    } else if (location.pathname === "/scenarios/use") {
        content = <UseScenarios setIsDragging={setIsDragging} />;
    } else {
        content = <div>ERROR!</div>
    }

    return content;
}

export default Scenarios;