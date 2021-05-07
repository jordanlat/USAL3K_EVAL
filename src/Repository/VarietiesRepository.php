<?php

namespace App\Repository;

use App\Entity\Varieties;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Varieties|null find($id, $lockMode = null, $lockVersion = null)
 * @method Varieties|null findOneBy(array $criteria, array $orderBy = null)
 * @method Varieties[]    findAll()
 * @method Varieties[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class VarietiesRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Varieties::class);
    }

    // /**
    //  * @return Varieties[] Returns an array of Varieties objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('v')
            ->andWhere('v.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('v.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Varieties
    {
        return $this->createQueryBuilder('v')
            ->andWhere('v.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
