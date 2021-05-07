<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210507085636 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE sales (id INT AUTO_INCREMENT NOT NULL, variety_id INT DEFAULT NULL, dateadd DATE DEFAULT NULL, weight INT DEFAULT NULL, unitprice NUMERIC(5, 2) DEFAULT NULL, active INT DEFAULT NULL, INDEX IDX_6B81704478C2BC47 (variety_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE varieties (id INT AUTO_INCREMENT NOT NULL, vegetable_id INT DEFAULT NULL, variety VARCHAR(100) DEFAULT NULL, color1 VARCHAR(20) DEFAULT NULL, color2 VARCHAR(200) DEFAULT NULL, color3 VARCHAR(20) DEFAULT NULL, INDEX IDX_EF211793D33F4D6 (vegetable_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE vegetables (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(50) DEFAULT NULL, lifetime INT DEFAULT NULL, fresh INT DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE sales ADD CONSTRAINT FK_6B81704478C2BC47 FOREIGN KEY (variety_id) REFERENCES varieties (id)');
        $this->addSql('ALTER TABLE varieties ADD CONSTRAINT FK_EF211793D33F4D6 FOREIGN KEY (vegetable_id) REFERENCES vegetables (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE sales DROP FOREIGN KEY FK_6B81704478C2BC47');
        $this->addSql('ALTER TABLE varieties DROP FOREIGN KEY FK_EF211793D33F4D6');
        $this->addSql('DROP TABLE sales');
        $this->addSql('DROP TABLE varieties');
        $this->addSql('DROP TABLE vegetables');
    }
}
