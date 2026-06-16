import re
from typing import List


class MessageFilter:
    def __init__(self, keywords: List[str], stop_words: List[str]):
        self.keywords = [kw.lower().strip() for kw in keywords if kw.strip()]
        self.stop_words = [sw.lower().strip() for sw in stop_words if sw.strip()]

    def is_relevant(self, text: str) -> bool:
        if not text:
            return False
        text_lower = text.lower()

        if self.stop_words:
            for sw in self.stop_words:
                if sw in text_lower:
                    return False

        if not self.keywords:
            return False

        for kw in self.keywords:
            if kw in text_lower:
                return True

        return False


def build_filter(project_keywords: list, project_stop_words: list) -> MessageFilter:
    return MessageFilter(project_keywords, project_stop_words)
