<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use App\Repository\VarietiesRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ApiResource()
 * @ORM\Entity(repositoryClass=VarietiesRepository::class)
 */
class Varieties
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=100, nullable=true)
     */
    private $variety;

    /**
     * @ORM\Column(type="string", length=20, nullable=true)
     */
    private $color1;

    /**
     * @ORM\Column(type="string", length=200, nullable=true)
     */
    private $color2;

    /**
     * @ORM\Column(type="string", length=20, nullable=true)
     */
    private $color3;

    /**
     * @ORM\ManyToOne(targetEntity=Vegetables::class)
     */
    private $vegetable;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getVariety(): ?string
    {
        return $this->variety;
    }

    public function setVariety(?string $variety): self
    {
        $this->variety = $variety;

        return $this;
    }

    public function getColor1(): ?string
    {
        return $this->color1;
    }

    public function setColor1(?string $color1): self
    {
        $this->color1 = $color1;

        return $this;
    }

    public function getColor2(): ?string
    {
        return $this->color2;
    }

    public function setColor2(?string $color2): self
    {
        $this->color2 = $color2;

        return $this;
    }

    public function getColor3(): ?string
    {
        return $this->color3;
    }

    public function setColor3(?string $color3): self
    {
        $this->color3 = $color3;

        return $this;
    }

    public function getVegetable(): ?Vegetables
    {
        return $this->vegetable;
    }

    public function setVegetable(?Vegetables $vegetable): self
    {
        $this->vegetable = $vegetable;

        return $this;
    }
}
