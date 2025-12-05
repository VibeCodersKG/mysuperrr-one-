-- Создание таблицы для статей осуждения
CREATE TABLE IF NOT EXISTS articles (
    id BIGSERIAL PRIMARY KEY,
    client_id BIGINT NOT NULL,
    article VARCHAR(255),
    part VARCHAR(255),
    point VARCHAR(255),
    CONSTRAINT fk_articles_client FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE CASCADE
);

-- Создаём индекс для быстрого поиска статей по client_id
CREATE INDEX idx_articles_client_id ON articles(client_id);

-- Удаляем старые колонки из таблицы clients (если они существуют)
ALTER TABLE clients DROP COLUMN IF EXISTS code;
ALTER TABLE clients DROP COLUMN IF EXISTS article;
ALTER TABLE clients DROP COLUMN IF EXISTS part;
ALTER TABLE clients DROP COLUMN IF EXISTS point;

COMMENT ON TABLE articles IS 'Статьи осуждения клиентов (может быть несколько статей у одного клиента)';
COMMENT ON COLUMN articles.client_id IS 'ID клиента';
COMMENT ON COLUMN articles.article IS 'Номер статьи УК';
COMMENT ON COLUMN articles.part IS 'Часть статьи';
COMMENT ON COLUMN articles.point IS 'Пункт статьи';
